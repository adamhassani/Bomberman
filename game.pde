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
      if ( k == 'd' || keyCode == RIGHT ) {
        PVector direction = new PVector(_board._cellSize, 0);
        _hero.move(_board, direction);
    }
    if ( k == 's' || keyCode == DOWN ) {
        PVector direction = new PVector(0, _board._cellSize);
        _hero.move(_board, direction);
    }
    if ( k == 'q' || keyCode == LEFT ) {
        PVector direction = new PVector(-_board._cellSize, 0 );
        _hero.move(_board, direction);
    }
    if ( k == 'z' || keyCode == UP ) {
        PVector direction = new PVector(0, -_board._cellSize);
        _hero.move(_board, direction);
    }
  }
}
