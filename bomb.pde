class Bomb {
  float _timeToExplode;
  int _cellX, _cellY;
  int _explosionRadius;
  Sprites _BombSprite;
  PVector _position;
  boolean _start;

  Bomb(Hero hero, Board board) {
    _timeToExplode = 500;
    _cellX = hero._cellX;
    _cellY = hero._cellY;
    _position = new PVector(_cellX * board._cellSize, ((_cellY + 2) * board._cellSize) + board._cellSize / 2);
    _explosionRadius = 1;
    _BombSprite = new Sprites("data/img/tiles.png");
    _start = false; 
  }

  void drawIt(PVector position) {

    _BombSprite.animatedBomb(position.x, position.y, game._board._cellSize);
  }


  void update(Board board, Hero hero) {
    _position = new PVector(_cellX * board._cellSize, ((_cellY + 2) * board._cellSize) + board._cellSize / 2);
    if (hero._positionCenter.x > (hero._cellX + 1) * board._cellSize) {
      _cellX = hero._cellX + 1;
    }

    if (hero._positionCenter.y > (hero._cellY + 1) * board._cellSize) {
      _cellY = hero._cellY + 1;
    }

    if (hero._positionCenter.x < hero._cellX * board._cellSize) {
      _cellX = hero._cellX - 1;
    }

    if (hero._positionCenter.y < hero._cellY * board._cellSize) {
      _cellY = hero._cellY - 1;
    }
    println("cell x bombe = ", _cellX, " cell y bombe = ", _cellY);
  }
}
