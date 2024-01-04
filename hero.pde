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

  Hero(Board board) {
    _cellX = 1;
    _cellY = 1;
    _size = board._cellSize;
    _position = board.getCellCenter(_cellX * _size, _cellY * _size);
    _wasHit = false;
    _heroSprite = new Sprites("data/img/characters.png");
    _direction = new PVector(0, 0);
    _facing = TypeSpriteHero.STATIC_DOWN;
  }

  void move(Board board,PVector direction) {
    // Calculate the target cell position based on the current position and direction
    int targetCellX = _cellX + (int)(_direction.x / _size);
    int targetCellY = _cellY + (int)(_direction.y / _size);
    println("cellX =", _cellX," cellY =", _cellY);
    println("prochaine cellX =", targetCellX," prochaine cellY =", targetCellY);

    // Check if the target cell is within the board boundaries and not a wall
    if (targetCellX >= 0 && targetCellX < board._nbCellsX &&
        targetCellY >= 0 && targetCellY < board._nbCellsY &&
        board._cells[targetCellX][targetCellY] == TypeCell.EMPTY) {
      // Update the cell position
      _cellX = targetCellX;
      _cellY = targetCellY;

      // Update the position based on the new cell position
      _position = game._board.getCellCenter(_cellX * _size, _cellY * _size);
    }
  }

  void update(Board board) {
    
  }

  void drawIt(Board board) {
    move(board, _direction);
    PVector center = game._board.getCellCenter(_cellX, _cellY);
    float posX = _cellX * _size;
    float posY = (_cellY + 2) * _size;

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
      image(currentSprite,posX, posY, _size, _size * 3/2);
    }
  }
}
