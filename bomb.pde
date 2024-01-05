class Bomb {
  float _timeToExplode;
  int _cellX, _cellY;
  int _explosionRadius;
  Sprites _BombSprite;
  PVector _position;

  Bomb(Hero hero, Board board) {
    _timeToExplode = 500;
    _cellX = hero._cellX;
    _cellY = hero._cellY;
    _position = new PVector(_cellX * board._cellSize, ((_cellY + 2) * board._cellSize) + board._cellSize / 2);
    _explosionRadius = 1;
    _BombSprite = new Sprites("data/img/tiles.png");
  }
  
  void drawIt(){
    _BombSprite.animatedBomb(_position.x,_position.y,game._board._cellSize);
  }
  

  void update(Board board, Hero hero) {
    _cellX = hero._cellX;
    _cellY = hero._cellY;
  }
}
