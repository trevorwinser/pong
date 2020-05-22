


boolean leftUp, leftDown, rightUp, rightDown;

Game game;
void setup() {
  rectMode(CORNERS);
  size(800, 600);
  
  // This must be done after calling size as it uses width and height;
   game = new Game();
}

void mousePressed() {
  game.mousePressed();
}

void keyPressed() {
  if (key == 'w') {
    leftDown = true;
  } else if (key == 's') {
    leftUp = true;
  }

  if (keyCode == UP) {
    rightDown = true;
  } else if (keyCode == DOWN) {
    rightUp = true;
  }
  if (key == 'r') {
    game.reset();
  }
}

void keyReleased() {
  if (key == 'w') {
    leftDown = false;
  } else if (key == 's') {
    leftUp = false;
  }

  if (keyCode == UP) {
    rightDown = false;
  } else if (keyCode == DOWN) {
    rightUp = false;
  }
}

void draw() {
  game.draw();
}
