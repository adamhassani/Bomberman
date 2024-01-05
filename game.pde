class Game
{
  Board _board;
  Hero _hero;
  PVector _drawSize;

  String _levelName;

  Game() {
    PVector origin = new PVector(0, 2*(width / 13));
    PVector drawSize = new PVector(width, height);
    _board = new Board(origin, drawSize, 13, 15);
    _hero = new Hero(_board);
  }

  void update() {
    _hero.update(_board);
  }

  void drawIt() {
    _board.drawIt();
    _hero.drawIt(_board);
  }

  void handleKey(int k) {
    //A l'interieur de chaque boucle, premiere action pour bouger le personnage et deuxieme pour activer l'animation
    if ( k == 'd' || k == 'D' || keyCode == RIGHT ) {
      _hero._direction.set(_hero._size, 0);
      if (!keyRight) {
        keyUp = false;
        keyDown = false;
        keyLeft = false;
        keyRight = true;
      }
    }
    if ( k == 's' || k == 'S' || keyCode == DOWN ) {
      _hero._direction.set(0, _hero._size);
      if (!keyDown) {
        keyUp = false;
        keyDown = true;
        keyLeft = false;
        keyRight = false;
      }
    }
    if ( k == 'q' || k == 'Q' || keyCode == LEFT ) {
      _hero._direction.set(-_hero._size, 0 );
      if (!keyLeft) {
        keyUp = false;
        keyDown = false;
        keyLeft = true;
        keyRight = false;
      }
    }
    if ( k == 'z' || k == 'Z' || keyCode == UP ) {
      _hero._direction.set(0, -_hero._size);
      if (!keyUp) {
        keyUp = true;
        keyDown = false;
        keyLeft = false;
        keyRight = false;
      }
    }
  }

  void keyReleased() {
    _hero._direction.set(0, 0); // Réinitialiser la direction à zéro lorsque la touche est relâchée

    //Animation du personnage
    if ( key == 'z' || key == 'Z' || keyCode == UP ) {
      keyUp = false;
    }
    if ( key == 's' || key == 'S' || keyCode == DOWN ) {
      keyDown = false;
    }
    if ( key == 'q' || key == 'Q' || keyCode == LEFT ) {
      keyLeft = false;
    }
    if ( key == 'd' || key == 'D' || keyCode == RIGHT ) {
      keyRight = false;
    }
  }
}
