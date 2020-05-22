class Paddle {
  Rect rect;
  String side;
  float size = 50;

  Paddle(String aSide) {
    side = aSide;
    float thickness = 10;
    float offset = 20;
    if (side == "left") {
      this.rect = new Rect(offset, height / 2 - size, offset + thickness, height / 2 + size);
    } else {
      this.rect = new Rect(width - offset - thickness, height / 2 - size, width - offset, height / 2 + size);
    }
  }

  void Draw() {
    fill(255);
    noFill();
    stroke(255);
    rect(rect.x1, rect.y1, rect.x2, rect.y2);
  }


  void moveDown() {
    move(10);
  }

  void moveUp() {
    move(-10);
  }

  void move(float speed) {
    rect.y1 -= speed;
    rect.y2 -= speed;

    if (rect.y1 < 0) {
      rect.y1 = 0;
      rect.y2 = 2 * size;
    } else if (rect.y2 > height) {
      rect.y1 = height - 2 * size;
      rect.y2 = height;
    }
  }
}
