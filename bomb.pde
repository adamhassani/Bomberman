class Bomb {
  float _timeToExplode;
  int _cellX, _cellY;
  int _explosionRadius;
  Sprites _BombSprite;

  Bomb() {
    _timeToExplode = 500;
    _cellX = game._hero._cellX;
    _cellY = game._hero._cellY;
    _explosionRadius = 1;
    _BombSprite = new Sprites("data/img/tiles.png");
  }
  
  void drawIt(){
    _BombSprite.animatedBomb(_cellX,_cellY,game._board._cellSize);
  }
  
  void handleKey(){
    if (key == 'b'){
      drawIt();
    } 
  }

  void update(Board board, Hero hero) {
  }
}
