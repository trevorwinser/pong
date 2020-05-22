class Ball {
  float x;
  float y;
  float dx;
  float dy;
  float radius = 7;
  float value;
  float nonZeroRandomValue(float min, float max) {
    float value;

    do {
      value = random(min, max);
    } while (abs(value) < 3);
    this.value = value;
    return value;
  }


  Ball() {
    x = width / 2;
    y = height / 2;

    // If the maximum speed is greater than the thickness of the paddles then the ball might sneak past. Something to fix in the future.
    dx = nonZeroRandomValue(-8, 8);
    dy = nonZeroRandomValue(-8, 8);
  }

  void Draw() {
    ellipse(x, y, radius * 2, radius * 2);
    println("ball", x, y, dx, dy, value);
  }

  void bounceHorizontally() {
    dx = -dx;
  }

  void bounceVertically() {
    dy = -dy;
  }

  void bounceDiagonally() {
    bounceHorizontally();
    bounceVertically();
  }

  void checkForCollision(Rect rect) {
    Rect topEdge = rect.topEdge(radius);
    if (rect.topEdge(radius).pointInRect(x, y) || rect.bottomEdge(radius).pointInRect(x, y)) {
      bounceVertically();
    } else     if (rect.leftEdge(radius).pointInRect(x, y) || rect.rightEdge(radius).pointInRect(x, y)) {
      bounceHorizontally();
    } else if (dist(x, y, rect.x1, rect.y1) < radius || dist(x, y, rect.x1, rect.y2) < radius || dist(x, y, rect.x2, rect.y1) < radius || dist(x, y, rect.x2, rect.y2) < radius) {
      bounceDiagonally();
    }
  }
  void update() {

    x += dx;
    y += dy;
  }
}
