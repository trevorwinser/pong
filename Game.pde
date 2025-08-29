class Game {
  String gameState = "start";

  int leftScore;
  int rightScore;
  Paddle leftPaddle;
  Paddle rightPaddle;
  Ball ball;
  Rect topEdge = new Rect(0, -1000, width, 0);
  Rect bottomEdge = new Rect(0, height, width, height + 1000);

  Game() {
  }

  void leftScore() {
    leftScore++;
  }

  void rightScore() {
    rightScore++;
  }

  void mousePressed() {
    switch(gameState) {
    case "start":
      play();
      break;
    case "play":
      break;
    case "end":
      reset();
      break;
    }
  }

  void play() {
    gameState = "play";
    leftScore = 0;
    rightScore = 0;
    ball = new Ball();
    leftPaddle = new Paddle("left");
    rightPaddle = new Paddle("right");
  }
  void reset() {
    gameState = "start";
  }

  void draw() {
    switch (gameState) {
    case "start":
      drawStart();
      break;
    case "play":
      drawPlay();
      break;
    case "end":
      drawEnd();
      break;
    }
  }

  void update() {
    if (leftUp) {
      leftPaddle.moveUp();
    } else if (leftDown) {
      leftPaddle.moveDown();
    }

    if (rightUp) {
      rightPaddle.moveUp();
    } else if (rightDown) {
      rightPaddle.moveDown();
    }

    ball.update();

    // Check for collision with the paddles

    ball.checkForCollision(leftPaddle.rect);
    ball.checkForCollision(rightPaddle.rect);

    // Check for collision with the edges
    ball.checkForCollision(bottomEdge);
    ball.checkForCollision(topEdge);

    if (ball.x < 0) {
      rightScore();
      ball = new Ball();
    } else if (ball.x > width) {
      leftScore();
      ball = new Ball();
    }

    if (leftScore == 5 || rightScore == 5) {
      gameState = "end";
    }
  }

  void drawPlay() {
    update();

    background(0);

    fill(255);
    rectMode(CENTER);
    textSize(32);

    text(leftScore, width / 2.0 - 100, 50);
    text(rightScore, width / 2.0 + 100, 50);

    rectMode(CORNERS);

    leftPaddle.Draw();
    rightPaddle.Draw();

    if (ball != null) {
      ball.Draw();
    }
  }

  void drawStart() {
    background(0);
    fill(255);
    textSize(32);
    int line = 0;
    int x = width / 5;
    int y = height / 5;
    text("Pong by Trevor Winser", x, y + line++ * 40);
    text("Click mouse to start", x, y + line++ * 40);
    text("Press r to restart", x, y + line++ * 40);

    textSize(24);

    line++;
    text("Left player controls", x, y + line++ * 40);
    text("   w to move up, s to move down", x, y + line++ * 40);
    line++;
    text("Right player controls", x, y + line++ * 40);
    text("   up-arrow to move up, down-arrow to move down", x, y + line++ * 40);
  }


  void drawEnd() {
    background(0);
    fill(255);
    textSize(32);
    text("Game over!", width / 4, height /2 - 40);
    if (leftScore > rightScore) {
      text("Left player wins", width /4, height /2);
    } else {
      text("Right player wins", width / 4, height /2);
    }
  }
}
