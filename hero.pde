class Hero {
  // position on screen
  PVector _position;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  // if hero was hit by a bomb
  boolean _wasHit;

  Hero() {
    _cellX = 1;
    _cellY = 1;
    _size = 24;
    _position = new PVector(_cellX,_cellY);
    _wasHit = false;
  }

  void move(Board board, PVector direction) {
  }

  void update(Board board) {
  }

  void drawIt() {
    Sprites sprites = new Sprites("data/img/characters.png");
    sprites.defBomberman();
  }
}
