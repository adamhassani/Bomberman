class Mob {
  PVector[] _position, _positionCenter, _positionDraw;
  PVector[] _cell;
  float _size;
  boolean[] _wasHit;
  PVector[] _direction;
  TypeSpriteMob[] _facing;
  Sprites _mobSprite;
  int _numMob;

  Mob(Board board) {
    _numMob = board._level._spawnPointMob.size();
    _cell = new PVector[_numMob];
    _position = new PVector[_numMob];
    _positionCenter = new PVector[_numMob];
    _wasHit = new boolean[_numMob];
    _facing = new TypeSpriteMob[_numMob];
    _direction = new PVector[_numMob];
    _positionDraw = new PVector[_numMob];
    _size = board._cellSize;
    _mobSprite = new Sprites("data/img/characters.png");
    
    
    for (int i = 0; i < _numMob; i++) {
      _cell[i] = new PVector();
      _cell[i].x = board._level._spawnPointMob.get(i).x;
      _cell[i].y = board._level._spawnPointMob.get(i).y +board._margin;
      _position[i] = new PVector(_cell[i].x * _size, _cell[i].y * _size);
      _positionCenter[i] = board.getCellCenter(_position[i].x, _position[i].y);
      _wasHit[i] = false;
      _facing[i] = TypeSpriteMob.GOING_DOWN1;
      _direction[i] = new PVector(0, 0);
    }

    
    
  }

  void drawIt() {
    for (int i = 0; i < _numMob; i++) {
      _positionDraw[i] = new PVector(_position[i].x, _position[i].y - _size/2);
      PImage currentSprite = _mobSprite.defSpriteMob().get(_facing[i]);
      image(currentSprite, _positionDraw[i].x, _positionDraw[i].y, _size, _size * 3/2);
      println(" mob",i," cellX =",_cell[i].x," cellY =",_cell[i].y,"position =",_positionDraw[i].x, _positionDraw[i].y);
      println("numMob = ",_numMob);
    }
  }
}
