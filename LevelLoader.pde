class LevelLoader {

  String[] _lines;
  Sprites _sprites;

  LevelLoader(String filePath) {

    _lines = loadStrings(filePath);
    _sprites = new Sprites("data/img/tiles.png");
  }

  PImage[][] loadLevel(Board board) {

    PImage[][] level = new PImage[board._cells.length][board._cells[0].length];
    
    HashMap<TypeSpriteLevel, PImage> definedSprites = _sprites.defSpritesLevel();
    
    //Creation du plateau de jeu
    for ( int column = 0; column < board._cells.length; column++) {
      for ( int line = 0; line < board._cells[column].length; line++) {

        //Determine l'etat de la cellule actuelle.
        final boolean isEmpty = _lines[line].charAt(column) == 'v' || _lines[line].charAt(column) == 'B' || _lines[line].charAt(column) == 'M';
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

        if (isEmpty) {
          board._cells[column][line] = TypeCell.EMPTY;
          level[column][line] = (definedSprites.get(TypeSpriteLevel.EMPTY));

          if (isUnderWall) {
            level[column][line] = (definedSprites.get(TypeSpriteLevel.EMPTY_UNDER_BUILD));
          } else if (isUnderDestructibleWall) {
            level[column][line] = (definedSprites.get(TypeSpriteLevel.EMPTY_UNDER_DESTRUCTIBLE_WALL));
          }
        }

        if (isWall) {
          board._cells[column][line] = TypeCell.WALL;
          level[column][line] = (definedSprites.get(TypeSpriteLevel.WALL));

          if (isTopLeft)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.TOP_LEFT));
          else if (isTopRight)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.TOP_RIGHT));
          else if (isBottomLeft)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.BOTTOM_LEFT));
          else if (isBottomRight)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.BOTTOM_RIGHT));
          else if (isLeftEdge)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.LEFT_EDGE));
          else if (isRightEdge)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.RIGHT_EDGE));
          else if (isTopEdge)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.TOP_EDGE));
          else if (isBottomEdge)
            level[column][line] = (definedSprites.get(TypeSpriteLevel.BOTTOM_EDGE));
        }

        if (isDestructible) {
          board._cells[column][line] = TypeCell.DESTRUCTIBLE_WALL;
          level[column][line] = (definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL1));

          if (isUnderWall || isUnderDestructibleWall) {
            level[column][line] = (definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD1));
          }
        }

        if (isExit) {
          board._cells[column][line] = TypeCell.EXIT_DOOR;
          level[column][line] = (definedSprites.get(TypeSpriteLevel.EXIT_DOOR1));
        }
      }
    }
    return level;
  }
}
