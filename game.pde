class Game
{
  Board _board;
  Hero _hero;

  String _levelName;

  Game() {
    PVector origin = new PVector(0, 2*(width / 13));
    PVector drawSize = new PVector(width, height*14/16);
    _board = new Board(origin, drawSize, 13, 15);
    _hero = new Hero();
  }

  void update() {
  }

  void drawIt() {
    _board.drawIt();
    _hero.drawIt();
  }

  void handleKey(int k) {
    int column = 1;
    int line = 1;
    if (column < 11 && line < 14 ) {
      if ( k == 'd' || k == 'D' || keyCode == RIGHT ) {
        PVector direction = new PVector(_board._cellSize, 0);
        if (_board._cells[column][line+1] == TypeCell.WALL) {
          _hero.move(direction);
          column += 1;
        }
      }
      if ( k == 's' || k == 'S' || keyCode == DOWN ) {
        PVector direction = new PVector(0, _board._cellSize);
        _hero.move(direction);
      }
      if ( k == 'q' || k == 'Q' || keyCode == LEFT ) {
        PVector direction = new PVector(-_board._cellSize, 0 );
        _hero.move(direction);
        line -= 1;
      }
      if ( k == 'z' || k == 'Z' || keyCode == UP ) {
        PVector direction = new PVector(0, -_board._cellSize);
        _hero.move(direction);
        column -= 1;
      }
    }
  }
}
