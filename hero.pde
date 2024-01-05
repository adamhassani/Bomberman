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

  Sprites _heroSprite;

  Hero(Board board) {
    _cellX = 1;
    _cellY = 1;
    _size = board._cellSize;
    _position = new PVector(1 * _size, (1 + 2) * _size);
    _positionCenter = board.getCellCenter(_position.x, _position.y - (_size * 2));
    _wasHit = false;
    _heroSprite = new Sprites("data/img/characters.png");
    _direction = new PVector(0, 0);
    _facing = TypeSpriteHero.STATIC_DOWN;
  }

  void move(Board board) {
    int targetCellX = _cellX + (int)(_direction.x / _size);
    int targetCellY = _cellY + (int)(_direction.y / _size);
    println("cellX =", _cellX, " cellY =", _cellY);
    println("prochaine cellX =", targetCellX, " prochaine cellY =", targetCellY);

    //On verfie si la case dans laquel on veut aller est vide
    if (targetCellX >= 0 && targetCellX < board._nbCellsX &&
      targetCellY >= 0 && targetCellY < board._nbCellsY &&
      board._cells[targetCellX][targetCellY] == TypeCell.EMPTY) {

      _position.x += _direction.x/18;
      _position.y += _direction.y/18;
    }
  }

  void update(Board board) {
    _positionCenter = board.getCellCenter(_position.x, _position.y - (_size * 2));


    if (_positionCenter.x > board.getCellCenter((_cellX + 1) * _size, _cellY * _size).x) {
      _cellX ++;
    }
    
    if (_positionCenter.x < board.getCellCenter((_cellX + -1) * _size, _cellY * _size).x) {
      _cellX = _cellX -1;
    }
    
    if (_positionCenter.y > board.getCellCenter(_cellX  * _size, (_cellY + 1) * _size).y) {
      _cellY ++;
    }
    
    if (_positionCenter.y < board.getCellCenter(_cellX  * _size, (_cellY - 1) * _size).y) {
      _cellY = _cellY -1;
    }
  }

  void drawIt(Board board) {
    move(board);
    float posX = _position.x ;
    //println("position x = ", _position.x);
    float posY = _position.y;
    //println("position y = ", _position.y);


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
  }
}
