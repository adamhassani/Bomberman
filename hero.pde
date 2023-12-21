class Hero {
  // position on screen
  PVector _position;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  // if hero was hit by a bomb
  boolean _wasHit;
  
  Sprites _heroSprite;

  Hero() {
    _cellX = 1;
    _cellY = 1;
   // _size = game._board._cellSize;
    _position = new PVector(_cellX,_cellY);
    _wasHit = false;
    _heroSprite = new Sprites("data/img/characters.png");
  }

  void move(Board board, PVector direction) {
  }

  void update(Board board) {
  }

  void drawIt() {
    //image(_heroSprite.defBomberman().get(TypeSpriteHero.FRONT),_position.x,_position.y,_size,_size);
  }
}
