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
    if ( k == 'd' || k == 'D' || keyCode == RIGHT ) {
      _hero._direction.set(_board._cellSize, 0);
      /*if (_board._cells[column][line+1] == TypeCell.WALL) {
       _hero.move(_hero._direction);
       column += 1;*/
    }
    if ( k == 's' || k == 'S' || keyCode == DOWN ) {
      _hero._direction.set(0, _board._cellSize);
      _hero.move(_hero._direction);
    }
    if ( k == 'q' || k == 'Q' || keyCode == LEFT ) {
      _hero._direction.set(-_board._cellSize, 0 );
      _hero.move(_hero._direction);
      //line -= 1;
    }
    if ( k == 'z' || k == 'Z' || keyCode == UP ) {
      _hero._direction.set(0, -_board._cellSize);
      _hero.move(_hero._direction);
      //column -= 1;
    }
  }
  void keyReleased() {
    _hero._direction.set(0, 0); // Réinitialiser la direction à zéro lorsque la touche est relâchée
  }
}
