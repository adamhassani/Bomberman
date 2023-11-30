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
  int _cellSize; // cells should be square

  Board(PVector drawPosition, PVector drawSize, int nbCellsX, int nbCellsY) {
    _drawPosition = _drawPosition;
    _drawSize = drawSize;
    _nbCellsX = nbCellsX;
    _nbCellsY = nbCellsY;
    _cellSize = width / nbCellsX;
    _cells = new TypeCell[nbCellsX][nbCellsY];
  }
  
  PVector getCellCenter(int i, int j) {
    return null;
  }

  void drawIt() {
    
  }
}
