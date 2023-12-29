class Hero {
  // position on screen
  PVector _position;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  // if hero was hit by a bomb
  boolean _wasHit;
  // direction du hero
  PVector _direction;

  Sprites _heroSprite;

  Hero() {
    _cellX = height / 32;
    _cellY = 2 * height / 13;
    _size = 75;
    _position = new PVector(_cellX, _cellY);
    _wasHit = false;
    _heroSprite = new Sprites("data/img/characters.png");
    _direction = new PVector(0,0);
    
  }

  void move(PVector direction) {
    _position.x += direction.x/10;
    _position.y += direction.y/10;
  }

  void update(Board board) {
  }

  void drawIt() {
    move(_direction);
    PVector center = game._board.getCellCenter(_position.x, _position.y);
    PImage currentSprite = _heroSprite.defSpriteBomberman().get(TypeSpriteHero.STATIC_DOWN);
    image(currentSprite, center.x, center.y, 2 * _size / 3, _size);
  }
}
