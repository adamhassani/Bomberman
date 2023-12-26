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
  PImage[][] _cellImage; // Tableau de toutes les cells du board

  Board(PVector drawPosition, PVector drawSize, int nbCellsX, int nbCellsY) {
    _drawPosition = drawPosition;
    _drawSize = drawSize;
    _nbCellsX = nbCellsX;
    _nbCellsY = nbCellsY;
    _cellSize = _drawSize.x / nbCellsY; // __ J'ai modifie X par Y
    _cells = new TypeCell[nbCellsY][nbCellsX];

    LevelLoader level = new LevelLoader("levels/level1.txt");
    _cellImage = level.loadLevel(this);
  }

  PVector getCellCenter(int i, int j) {

    return null;
  }

  void drawIt() {
    background(orange);
    
    // Dessin du board en utilisant le tableau de retourne par le levelloader
    for ( int column = 0; column < _cellImage.length; column++) {
      for ( int line = 0; line < _cellImage[column].length; line++) {
        float posX = column * _cellSize;
        float posY = (2 + line) * _cellSize + _cellSize/2;
        image(_cellImage[column][line], posX, posY, _cellSize, _cellSize);
      }
    }
  }
}
