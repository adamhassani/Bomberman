class Hero {
  // position on screen
  PVector _position;
  // position on board
  float _cellX, _cellY;
  // display size
  float _size;
  // if hero was hit by a bomb
  boolean _wasHit;
  
  Sprites _heroSprite;

  Hero() {
    _cellX = width/15;
    _cellY = 2*height/13;
    _size = 24;
    _position = new PVector(_cellX,_cellY);
    _wasHit = false;
    _heroSprite = new Sprites("data/img/characters.png"); 
  }

  void move(Board board, PVector direction) {
  }

  void update(Board board) {
  }

  void drawIt() {
    image(_heroSprite.defSpriteBomberman().get(TypeSpriteHero.FRONT),_position.x,_position.y,game._board._cellSize,_size+_position.x);
    
  }
}
