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
  float _cellSize; // cells should be square
  PImage _cellImage; // Image de chaque cell.

  Board(PVector drawPosition, PVector drawSize, int nbCellsX, int nbCellsY) {
    _drawPosition = drawPosition;
    _drawSize = drawSize;
    _nbCellsX = nbCellsX;
    _nbCellsY = nbCellsY;
    _cellSize = _drawSize.x / nbCellsY; // __ J'ai modifie X par Y
    _cells = new TypeCell[nbCellsY][nbCellsX];
    _cellImage = loadImage("data/img/tiles.png");
  }
  
  PVector getCellCenter(int i, int j) {
    return null;
  }

  void drawIt() {
    background(orange);
    LevelLoader level = new LevelLoader("levels/level1.txt");
    level.loadLevel(game._board); 
  }
}
