class LevelLoader {

  String[] _lines;

  LevelLoader(String filePath) {

    _lines = loadStrings(filePath);
  }

  void loadLevel(Board board) {

    HashMap<String, PImage> definedSprites = defSprites();

    //EMPTY
    PImage empty = definedSprites.get("empty");
    PImage emptyUnderDestructibleWall = definedSprites.get("emptyUnderDestructibleWall");
    PImage emptyUnderBuild = definedSprites.get("emptyUnderBuild");


    //WALL
    PImage wall = definedSprites.get("wall");
    PImage bottomEdge = definedSprites.get("bottomEdge");
    PImage topEdge = definedSprites.get("topEdge");
    PImage leftEdge = definedSprites.get("leftEdge");
    PImage rightEdge = invertSprite(leftEdge);

    PImage bottomLeft = definedSprites.get("bottomCorner");
    PImage bottomRight = invertSprite(bottomLeft);
    PImage topLeft = definedSprites.get("topCorner");
    PImage topRight = invertSprite(topLeft);


    //DESTRUCTIBLE_WALL
    PImage destructibleWall = definedSprites.get("destructibleWall");
    PImage destructibleWallUnderBuild = definedSprites.get("destructibleWallUnderBuild");


    //EXIT_DOOR
    PImage exitDoor = definedSprites.get("exitDoor");


    //Creation du plateau de jeu
    for ( int column = 0; column < board._cells.length; column++) {
      for ( int line = 0; line < board._cells[column].length; line++) {

        final boolean isEmpty = _lines[line].charAt(column) == 'v' || _lines[line].charAt(column) == 'B' || _lines[line].charAt(column) == 'M' || _lines[line].charAt(column) == 'o';
        final boolean isWall = _lines[line].charAt(column) == 'x';
        final boolean isDestructible = _lines[line].charAt(column) == 'o';
        final boolean isExit = _lines[line].charAt(column) == 'S';

        //Detection des bords
        boolean isLeftEdge = column == 0;
        boolean isRightEdge = column == board._cells.length - 1;
        boolean isTopEdge = line == 0;
        boolean isBottomEdge = line == board._cells[column].length - 1;

        //Detection des coins
        boolean isTopLeft = isTopEdge && isLeftEdge;
        boolean isTopRight = isTopEdge && isRightEdge;
        boolean isBottomLeft = isBottomEdge && isLeftEdge;
        boolean isBottomRight = isBottomEdge && isRightEdge;

        //Detection des sprites autour
        boolean isUnderWall = line > 0 && board._cells[column][line-1] == TypeCell.WALL;
        boolean isUnderDestructibleWall = line > 0 && board._cells[column][line-1] == TypeCell.DESTRUCTIBLE_WALL;


        float size = board._cellSize;
        float posX = column * size;
        float posY = (2 + line) * size+board._cellSize/2;

        if (isEmpty) {
          board._cells[column][line] = TypeCell.EMPTY;
          image(empty, posX, posY, size, size);

          if (isUnderWall) {
            image(emptyUnderBuild, posX, posY, size, size);
          } else if (isUnderDestructibleWall) {
            image(emptyUnderDestructibleWall, posX, posY, size, size);
          }
        }

        if (isWall) {
          board._cells[column][line] = TypeCell.WALL;
          image(wall, posX, posY, size, size);

          if (isTopLeft)
            image(topLeft, posX, posY, size, size);
          else if (isTopRight)
            image(topRight, posX, posY, size, size);
          else if (isBottomLeft)
            image(bottomLeft, posX, posY, size, size);
          else if (isBottomRight)
            image(bottomRight, posX, posY, size, size);
          else if (isLeftEdge)
            image(leftEdge, posX, posY, size, size);
          else if (isRightEdge)
            image(rightEdge, posX, posY, size, size);
          else if (isTopEdge)
            image(topEdge, posX, posY, size, size);
          else if (isBottomEdge)
            image(bottomEdge, posX, posY, size, size);
        }

        if (isDestructible) {
          board._cells[column][line] = TypeCell.DESTRUCTIBLE_WALL;
          image(destructibleWall, posX, posY, size, size);

          if (isUnderWall || isUnderDestructibleWall) {
            image(destructibleWallUnderBuild, posX, posY, size, size);
          }
        }

        if (isExit) {
          board._cells[column][line] = TypeCell.EXIT_DOOR;
          image(exitDoor, posX, posY, size, size);
        }
      }
    }
  }

  HashMap<String, PImage> defSprites() {
    PImage allSprites = loadImage("data/img/tiles.png");
    int spriteSize = 16;
    HashMap<String, PImage> sprites = new HashMap<>();

    //EMPTY
    sprites.put("empty", allSprites.get(3 * spriteSize, 6 * spriteSize, spriteSize, spriteSize));
    sprites.put("emptyUnderDestructibleWall", allSprites.get(4 * spriteSize, 6 * spriteSize, spriteSize, spriteSize));
    sprites.put("emptyUnderBuild", allSprites.get(3 * spriteSize, 5 * spriteSize, spriteSize, spriteSize));

    //WALL
    sprites.put("wall", allSprites.get(5 * spriteSize, 6 * spriteSize, spriteSize, spriteSize));
    sprites.put("bottomEdge", allSprites.get(2 * spriteSize, 6 * spriteSize, spriteSize, spriteSize));
    sprites.put("topEdge", allSprites.get(3 * spriteSize, 4 * spriteSize, spriteSize, spriteSize));
    sprites.put("leftEdge", allSprites.get(1 * spriteSize, 5 * spriteSize, spriteSize, spriteSize));
    sprites.put("bottomCorner", allSprites.get(1 * spriteSize, 6 * spriteSize, spriteSize, spriteSize));
    sprites.put("topCorner", allSprites.get(1 * spriteSize, 4 * spriteSize, spriteSize, spriteSize));


    //DESTRUCTIBLE_WALL
    sprites.put("destructibleWall", allSprites.get(4 * spriteSize, 4 * spriteSize, spriteSize, spriteSize));
    sprites.put("destructibleWallUnderBuild", allSprites.get(4 * spriteSize, 5 * spriteSize, spriteSize, spriteSize));

    //EXIT_DOOR
    sprites.put("exitDoor", allSprites.get(8 * spriteSize, 3 * spriteSize, spriteSize, spriteSize));

    return sprites;
  }

  PImage invertSprite(PImage sprite) {

    PImage invertedSprite = createImage(sprite.width, sprite.height, ARGB);

    for (int x = 0; x < sprite.width; x++) {
      for (int y = 0; y < sprite.width; y++) {
        int currentColor = sprite.get(x, y);
        invertedSprite.set(sprite.width - x - 1, y, currentColor);
      }
    }
    return invertedSprite;
  }
}
