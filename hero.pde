class Hero {
  // position on screen and position of the center of the hero
  PVector _position, _positionCenter;
  // position on board
  int _cellX, _cellY;
  // hero size
  float _size;
  // if hero was hit by a bomb
  boolean _wasHit;
  // direction du hero
  PVector _direction;
  //Orientation du Hero
  TypeSpriteHero _facing;
  int _lives;

  Sprites _heroSprite;

  Hero(Board board, Bomb bomb) {
    _cellX = (int) board._level._spawnPointHero.x;
    _cellY = (int) board._level._spawnPointHero.y + board._margin;
    _size = board._cellSize;
    _position = new PVector(_cellX * _size, _cellY * _size);
    _positionCenter = board.getCellCenter(_position.x, _position.y);
    _heroSprite = new Sprites("data/img/characters.png");
    _direction = new PVector(0, 0);
    _facing = TypeSpriteHero.STATIC_DOWN;
    _wasHit = false;
    _lives = 3;
  }

  void move(Board board) {
    int targetCellX = _cellX + (int)(_direction.x / _size);
    int targetCellY = _cellY + (int)(_direction.y / _size);

    //Definiton de la hitbox du hero
    boolean targetCellEmpty = targetCellX >= 0 && targetCellX <= board._nbCellsX &&
      targetCellY >= 0 && targetCellY < board._nbCellsY &&
      board._cells[targetCellX][targetCellY-board._margin] == TypeCell.EMPTY;
    boolean hitboxRight = _direction.x > 0 && _position.x + _size < (_cellX + 1) * _size;
    boolean hitboxLeft = _direction.x < 0 && _position.x > _cellX * _size;
    boolean hitboxDown = _direction.y > 0 && _position.y + _size < (_cellY + 1) * _size;
    boolean hitboxUp = _direction.y < 0 && _position.y > _cellY * _size;

    if (targetCellEmpty) {
      _position.x += _direction.x/18;
      _position.y += _direction.y/18;
    }
    if (hitboxRight) {
      _position.x += _direction.x/18;
      _position.y = _cellY * _size;
    }
    if (hitboxLeft) {
      _position.x += _direction.x/18;
      _position.y = _cellY * _size;
    }
    if (hitboxDown) {
      _position.y += _direction.y/18;
      _position.x = _cellX * _size;
    }
    if (hitboxUp) {
      _position.y += _direction.y/18;
      _position.x = _cellX * _size;
    }

    //println(board._cells[targetCellX][targetCellY - board._margin]);
    println("cell =",_cellX, _cellY);
    println("target cell =",targetCellX,targetCellY,board._cells[targetCellX][targetCellY - board._margin]);
    
  }

  void update(Board board, Bomb bomb) {
    heroCoordinates(board);
    if (_wasHit) {
      dies(board);
    }
  }

  void heroCoordinates(Board board) {
    boolean newCellXRight = _positionCenter.x > (_cellX + 1) * _size;
    boolean newCellXLeft  = _positionCenter.x < _cellX * _size;
    boolean newCellYUp    = _positionCenter.y > (_cellY + 1) * _size;
    boolean newCellYDown  = _positionCenter.y < _cellY * _size;

    _positionCenter       = board.getCellCenter(_position.x, _position.y);

    if (newCellXRight) {
      _cellX++;
    }
    if (newCellXLeft) {
      _cellX--;
    }
    if (newCellYUp) {
      _cellY++;
    }

    if (newCellYDown) {
      _cellY--;
    }
  }

  void isNearExplosion(Bomb bomb) {
    boolean isLeft = (_cellX == bomb._cellX - 1) && (_cellY == bomb._cellY);
    boolean isRight = (_cellX == bomb._cellX + 1 && _cellY == bomb._cellY);
    boolean isDown = (_cellY == bomb._cellY + 1 && _cellX == bomb._cellX);
    boolean isUp = (_cellY == bomb._cellY - 1 && _cellX == bomb._cellX);
    boolean isInside = (_cellX == bomb._cellX && _cellY == bomb._cellY);
    if ( isLeft  || isRight || isDown ||  isUp || isInside) {
      _wasHit = true;
    }
  }

  void dies(Board board) {
    if (_lives < 1) {
      exit();
    } else {
      _wasHit = false;
      _lives --;
      _cellX = (int) board._level._spawnPointHero.x;
      _cellY = (int) board._level._spawnPointHero.y + board._margin;
      _position = new PVector(_cellX * _size, _cellY * _size);
    }
  }
  void drawIt(Board board) {

    move(board);
    float posX = _position.x;
    float posY = _position.y - _size/2;

    //println(_position.x, _position.y);

    if (keyLeft) {
      _heroSprite.heroWalkingLeft(posX, posY, _size);
      _facing = TypeSpriteHero.STATIC_LEFT;
    }
    if (keyRight) {
      _heroSprite.heroWalkingRight(posX, posY, _size);
      _facing = TypeSpriteHero.STATIC_RIGHT;
    }
    if (keyUp) {
      _heroSprite.heroWalkingUp(posX, posY, _size);
      _facing = TypeSpriteHero.STATIC_UP;
    }
    if (keyDown) {
      _heroSprite.heroWalkingDown(posX, posY, _size);
      _facing = TypeSpriteHero.STATIC_DOWN;
    }

    // Detecte si le hero est statique et determine le sprite correspondant a son orientation.
    if (!keyLeft && !keyRight && !keyUp && !keyDown) {
      PImage currentSprite = _heroSprite.defSpriteBomberman().get(_facing);
      // Utilisez la sprite statique associée à la dernière direction
      image(currentSprite, posX, posY, _size, _size * 3/2);
    }
    if (_wasHit) {
      _heroSprite.heroDying(posX, posY, _size);
    }
  }
}
