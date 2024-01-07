class Mob {
  // position on screen and position of the center of the hero
  PVector _position, _positionCenter;
  // position on board
  int _cellX, _cellY;
  // hero size
  float _size;
  // direction du hero
  PVector _direction;
  //Orientation du Hero
  TypeSpriteMob _facing;
  boolean startedMoving;

  Sprites _mobSprite;

  Mob(int cellX, int cellY, Board board) {
    _cellX = cellX;
    _cellY = cellY + board._margin;
    _size = board._cellSize;
    _position = new PVector(_cellX * _size, _cellY * _size);
    _positionCenter = board.getCellCenter(_position.x, _position.y);
    _mobSprite = new Sprites("data/img/characters.png");
    _direction = new PVector(0, 0);
    _facing = TypeSpriteMob.GOING_DOWN1;
    startedMoving = false;
  }

  void move(Board board) {

    boolean cellUpEmpty = board._cells[_cellX][_cellY - 1 - board._margin] == TypeCell.EMPTY;
    boolean cellDownEmpty = board._cells[_cellX][_cellY + 1 - board._margin] == TypeCell.EMPTY;
    boolean cellRightEmpty = board._cells[_cellX + 1][_cellY - board._margin] == TypeCell.EMPTY;
    boolean cellLeftEmpty = board._cells[_cellX - 1][_cellY - board._margin] == TypeCell.EMPTY;

    boolean hitboxRight = _position.x + _size < (_cellX + 1) * _size;
    boolean hitboxLeft = _position.x > _cellX * _size;
    boolean hitboxDown =  _position.y + _size < (_cellY + 1) * _size;
    boolean hitboxUp = _position.y > _cellY * _size;

    if (!startedMoving) {
      if (cellUpEmpty) {
        _direction.set(0, -_size);
        startedMoving = true;
      }
    }

    if (_direction.y < 0) {
      if (hitboxUp && !cellUpEmpty);
        _direction.set(0,0);
    }

    _position.x += _direction.x/200;
    _position.y += _direction.y/200;

  }

  void mobCoordinates(Board board) {
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
  
  void update(Board board) {
    mobCoordinates(board);
    move(board);
  }


  void drawIt(Board board) {
    
    float posX = _position.x;
    float posY = _position.y - _size/2;
    PImage currentSprite = _mobSprite.defSpriteMob().get(_facing);
    image(currentSprite, posX, posY, _size, _size * 3/2);
  }
}
