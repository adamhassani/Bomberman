import java.util.HashMap;

Game game;
Menu menu;


void setup() {
  size(800, 800, P2D);
  game = new Game();
  menu = new Menu();
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
  game.handleKey(key);
}

void keyReleased() {
  game.keyReleased();
}

void mousePressed() {
  menu.handleMouse();
}
