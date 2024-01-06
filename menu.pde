class Button {
  String text;
  PVector topleft;
  PVector size;

  Button(String nameButton, PVector _topleft) {
    text = nameButton;
    topleft = new PVector(_topleft.x, _topleft.y);
    size = new PVector(500, 100);
  }

  boolean isTriggered() {
    return false;
  }
}

class Menu {
  Button resume;
  Button quit;
  Button start;
  PVector posButton;
  boolean isPlaying;
  boolean isPause;

  Menu() {
    posButton = new PVector(width/5, 0);
    start = new Button("Start", posButton);
    resume = new Button("Resume", posButton);
    quit = new Button("Quit", posButton);
    isPlaying = false;
    isPause = true;
  }

  void drawIt() {
    strokeWeight(3);
    fill(grey);
    rect(width / 10, height / 10, 0.8 * width, 0.8 * height, 10);

    posButton.y = 165;
    fill(orange);
    rect(posButton.x, posButton.y, 0.6 * width, height / 8, 10);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(start.text, width / 2, 200);

    posButton.y = 350;
    strokeWeight(3);
    fill(orange);
    rect(posButton.x, posButton.y, 0.6 * width, height / 8, 10);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(resume.text, width / 2, 385);

    posButton.y = 535;
    strokeWeight(3);
    fill(orange);
    rect(posButton.x, posButton.y, 0.6 * width, height / 8, 10);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(quit.text, width / 2, 565);
  }
  void handleKey() {
    if (key == ESC) {
      key=0;
      isPlaying = false;
      drawIt();
    }
    isPause = true;
  }

  void update(Game game) {
  }

  void handleMouse() {
    if (isPause) {
      if ((mouseX > width / 5) && (mouseX < width - width / 5) && (mouseY > height / 5) && (mouseY < 240) && (mouseButton == LEFT)) {
        isPlaying = true;
        isPause = false;
      }
      if ((mouseX > width / 5) && (mouseX < width - width / 5) && (mouseY > 350) && (mouseY < 450) && (mouseButton == LEFT)) {
        isPlaying = true;
        isPause = false;
      }
      if ((mouseX > width / 5) && (mouseX < width - width / 5) && (mouseY > 535) && (mouseY < height - height / 5) && (mouseButton == LEFT)) {
        isPause = false;
        exit();
      }
    }
  }
}
