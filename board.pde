enum TypeCell
{
  EMPTY, WALL, DESTRUCTIBLE_WALL, EXIT_DOOR
}

class Board
{
  TypeCell _cells[][];
  PVector _drawPosition; // origine
  PVector _drawSize; //proportion fenêtre plateau
  int _nbCellsX;
  int _nbCellsY;
  float _cellSize;
  PImage[][] _cellImage; // Tableau de toutes les cells du board
  LevelLoader level;
  Sprites sprite = new Sprites("data/img/tiles.png");

  Board(PVector drawPosition, PVector drawSize, int nbCellsX, int nbCellsY) {
    _drawPosition = drawPosition;
    _drawSize = drawSize;
    _nbCellsX = nbCellsX;
    _nbCellsY = nbCellsY;
    _cellSize = _drawSize.x / nbCellsY;
    _cells = new TypeCell[nbCellsY][nbCellsX];

    level = new LevelLoader("levels/level1.txt");
    _cellImage = level.loadLevel(this);
  }

  PVector getCellCenter(float i, float j) {
    PVector center = new PVector(i + _cellSize / 2, j + _cellSize / 2);
    return center;
  }

  void drawIt() {
    background(orange);

    // Dessin du board en utilisant le tableau de retourne par le levelloader
    for ( int column = 0; column < _cellImage.length; column++) {
      for ( int line = 0; line < _cellImage[column].length; line++) {
        float posX = column * _cellSize;
        float posY = (2 + line) * _cellSize + _cellSize/2;

        //Animation Mur destructible avec ombre
        if (sprite.areSpritesEqual(_cellImage[column][line], sprite.defSpritesLevel().get(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD1))) {
          sprite.animatedWall(posX, posY, this, TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD1);
        } 
        //Animation Mur destructible sans ombre
        else if (sprite.areSpritesEqual(_cellImage[column][line], sprite.defSpritesLevel().get(TypeSpriteLevel.DESTRUCTIBLE_WALL1))) {
          sprite.animatedWall(posX, posY, this, TypeSpriteLevel.DESTRUCTIBLE_WALL1);
        } 
        //Animation Porte de sortie
        else if (sprite.areSpritesEqual(_cellImage[column][line], sprite.defSpritesLevel().get(TypeSpriteLevel.EXIT_DOOR1))) {
          sprite.animatedDoor(posX, posY, this);
        } 
        //Sprite sans animation
        else {
          image(_cellImage[column][line], posX, posY, _cellSize, _cellSize);
        }
      }
    }
  }
}
