class Bomb {
  float _timeToExplode;
  int _cellX, _cellY;
  int _explosionRadius;
  Sprites _BombSprite;
  PVector _position;
  boolean _start;
  boolean _explode;
  long _startTime;

  Bomb(Hero hero, Board board) {
    _timeToExplode = 3000;
    _cellX = hero._cellX;
    _cellY = hero._cellY;
    _position = new PVector(_cellX * board._cellSize, _cellY * board._cellSize);
    _explosionRadius = 1;
    _explode = false;
    _BombSprite = new Sprites("data/img/tiles.png");
    _start = false; 
  }

  void drawIt(PVector position) {

    _BombSprite.animatedBomb(position.x, position.y, game._board._cellSize);
  }

  void startCountdown(Board board) {
    _explode = true;
    _startTime = millis();
  }

  void detonate(Board board,Hero hero) {
    if (_explode) {
      float elapsedTime = millis() - _startTime;
      if (elapsedTime >= _timeToExplode) {
        hero.isNearExplosion(this);
        explosion(board);
        
        _explode = false;
      }
    }
  }
  
  void explosion(Board board){
    boolean rightCellIsDes = board._cells[_cellX + 1][_cellY - board._margin] == TypeCell.DESTRUCTIBLE_WALL;
    boolean leftCellIsDes = board._cells[_cellX - 1][_cellY-board._margin] == TypeCell.DESTRUCTIBLE_WALL;
    boolean upCellIsDes = board._cells[_cellX][_cellY-board._margin - 1] == TypeCell.DESTRUCTIBLE_WALL;
    boolean downCellIsDes = board._cells[_cellX][_cellY - board._margin + 1] == TypeCell.DESTRUCTIBLE_WALL;
    
    if (rightCellIsDes){
      board._cells[_cellX + 1][_cellY - board._margin] = TypeCell.EMPTY;
    }
    if (leftCellIsDes){
      board._cells[_cellX - 1][_cellY - board._margin] = TypeCell.EMPTY;
    }
    if (upCellIsDes){
      board._cells[_cellX][_cellY - 1 - board._margin] = TypeCell.EMPTY;
    }
    if (downCellIsDes){
      board._cells[_cellX][_cellY + 1 - board._margin] = TypeCell.EMPTY;
    }
  }
    
    
    

  void followHero(Board board, Hero hero) {
    if (!_explode) {
      _cellX = hero._cellX;
      _cellY = hero._cellY;
      _position = new PVector(_cellX * board._cellSize, _cellY * board._cellSize);
    }
  }

  void update(Board board, Hero hero) {
    detonate(board, hero);
    followHero(board, hero);
  }
  
  void drawIt() {
    if (_explode) {
      _BombSprite.animatedBomb(_position.x, _position.y, game._board._cellSize);
    }
  }
}
