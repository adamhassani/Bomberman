class Game
{
  Board _board;
  Hero _hero;
  PVector _origin;
  PVector _drawSize;

  String _levelName;

  Game() {
    _origin = new PVector(0,2*(width / 13));
    _drawSize = new PVector(width,height*14/16);
    _board = new Board(_origin,_drawSize,13,15);
    _hero = new Hero();
  }

  void update() {
  }

  void drawIt() {
    _board.drawIt();
  }

  void handleKey(int k) {
  }
}
