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
    PImage lowerEdge = definedSprites.get("lowerEdge");
    PImage upperEdge = definedSprites.get("upperEdge");
    PImage lowerLeftCorner = definedSprites.get("lowerCorner");
    PImage lowerRightCorner = flipSprite(lowerLeftCorner, false, true);

    //DESTRUCTIBLE_WALL
    PImage destructibleWall = definedSprites.get("destructibleWall");
    PImage destructibleWallUnderBuild = definedSprites.get("destructibleWallUnderBuild");

    //EXIT_DOOR
    PImage exitDoor = definedSprites.get("exitDoor");

    for ( int column = 0; column < board._cells.length; column++) {
      for ( int line = 0; line < board._cells[column].length; line++) {
        //__println("column : "+column+", line : "+line);
        
        final boolean is_empty = _lines[line].charAt(column) == 'v' || _lines[line].charAt(column) == 'B' || _lines[line].charAt(column) == 'M' || _lines[line].charAt(column) == 'o';
        final boolean is_wall = _lines[line].charAt(column) == 'x';
        final boolean is_destructible = _lines[line].charAt(column) == 'o';
        final boolean is_exit = _lines[line].charAt(column) == 'S';

        //Determine l'etat de la cellule actuelle.
        float size = board._cellSize;
        float posX = column * size;
        float posY = (2 + line) * size;

        if (is_empty) {
          board._cells[column][line] = TypeCell.EMPTY;
          image(empty, posX, posY, size, size);
          }

        if (is_wall) {
          board._cells[column][line] = TypeCell.WALL;
          image(wall, posX, posY, size, size);
          }

        if (is_destructible) {
          board._cells[column][line] = TypeCell.DESTRUCTIBLE_WALL;
          image(destructibleWall, posX, posY, size, size);
          }

        if (is_exit) {
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
    sprites.put("lowerEdge", allSprites.get(2 * spriteSize, 6 * spriteSize, spriteSize, spriteSize));
    sprites.put("upperEdge", allSprites.get(3 * spriteSize, 4 * spriteSize, spriteSize, spriteSize));
    sprites.put("lowerCorner", allSprites.get(1 * spriteSize, 6 * spriteSize, spriteSize, spriteSize));


    //DESTRUCTIBLE_WALL
    sprites.put("destructibleWall", allSprites.get(4 * spriteSize, 4 * spriteSize, spriteSize, spriteSize));
    sprites.put("destructibleWallUnderBuild", allSprites.get(4 * spriteSize, 5 * spriteSize, spriteSize, spriteSize));

    //EXIT_DOOR
    sprites.put("exitDoor", allSprites.get(8 * spriteSize, 3 * spriteSize, spriteSize, spriteSize));

    return sprites;
  }

  PImage flipSprite(PImage sprite, boolean horizontal, boolean vertical) {

    PImage flippedSprite = createImage(sprite.width, sprite.height, ARGB);

    if (horizontal) {
      flippedSprite.copy(sprite, 0, 0, sprite.width, sprite.height, sprite.width, 0, 0, sprite.height);
    }

    if (vertical) {
      flippedSprite.copy(sprite, 0, 0, sprite.width, sprite.height, 0, sprite.height, sprite.width, 0);
    }

    return flippedSprite;
  }
}
