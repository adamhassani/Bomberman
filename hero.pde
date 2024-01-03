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
  //Orientation du Hero
  TypeSpriteHero _facing;

  Sprites _heroSprite;

  Hero() {
    _cellX = height / 32;
    _cellY = 2 * height / 13;
    _size = 75;
    _position = new PVector(_cellX, _cellY);
    _wasHit = false;
    _heroSprite = new Sprites("data/img/characters.png");
    _direction = new PVector(0, 0);
    _facing = TypeSpriteHero.STATIC_DOWN;
  }

  void move(PVector direction) {
    _position.x += direction.x/18;
    _position.y += direction.y/18;
  }

  void update(Board board) {
    //méthode pour faire les animations du hero
  }

  void drawIt() {
    move(_direction);
    PVector center = game._board.getCellCenter(_position.x, _position.y);

    if (keyLeft) {
      _heroSprite.heroWalkingLeft(center.x, center.y, _size);
      _facing = TypeSpriteHero.STATIC_LEFT;
    }
    if (keyRight) {
      _heroSprite.heroWalkingRight(center.x, center.y, _size);
      _facing = TypeSpriteHero.STATIC_RIGHT;
    }
    if (keyUp) {
      _heroSprite.heroWalkingUp(center.x, center.y, _size);
      _facing = TypeSpriteHero.STATIC_UP;
    }
    if (keyDown) {
      _heroSprite.heroWalkingDown(center.x, center.y, _size);
      _facing = TypeSpriteHero.STATIC_DOWN;
    }
    
    // Detecte si le hero est statique et determine le sprite correspondant a son orientation.
    if (!keyLeft && !keyRight && !keyUp && !keyDown) {
      PImage currentSprite = _heroSprite.defSpriteBomberman().get(_facing);
      // Utilisez la sprite statique associée à la dernière direction
      image(currentSprite, center.x, center.y, 2 * _size / 3, _size);
    }
  }
}
