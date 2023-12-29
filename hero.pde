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
    _cellX = height / 32;
    _cellY = 2 * height / 13;
    _size = 75;
    _position = new PVector(_cellX, _cellY);
    _wasHit = false;
    _heroSprite = new Sprites("data/img/characters.png");
  }

  void move(PVector direction) {
    _position.x += direction.x;
    _position.y += direction.y;
  }

  void update(Board board) {
  }

  void drawIt() {
    PVector center = game._board.getCellCenter(_position.x, _position.y);
    PImage currentSprite = _heroSprite.defSpriteBomberman().get(TypeSpriteHero.FRONT);
    image(currentSprite, center.x, center.y, 2 * _size / 3, _size);
  }
}
