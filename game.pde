class Game
{
  Board _board;
  Hero _hero;

  String _levelName;

  Game() {
    _board = new Board(new PVector(0,0),new PVector(width,height),16,14);
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
