import java.util.HashMap;

Game game;
Menu menu;
Bomb bomb;


void setup() {
  size(800, 800, P2D);
  game = new Game();
  menu = new Menu();
  bomb = new Bomb();
}

void draw() {
  menu.drawIt();
  if (menu.isPlaying) {
    game.update();
    game.drawIt();
  }
}

void keyPressed() {
  menu.handleKey();
  bomb.handleKey();
  game.handleKey(key);
  
}

void keyReleased() {
  game.keyReleased();
}

void mousePressed() {
  menu.handleMouse();
}
