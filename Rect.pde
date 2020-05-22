class Rect {

  float x1, y1, x2, y2;
  Rect(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  void draw() {
    fill(0, 255, 0);
    rectMode(CORNERS);
    rect(x1, y1, x2, y2);
  }

  Rect leftEdge(float padding) {
    return new Rect(this.x1 - padding, this.y1, this.x1, this.y2);
  }

  Rect rightEdge(float padding) {
    return new Rect(this.x2, this.y1, this.x2 + padding, this.y2);
  }

  Rect topEdge(float padding) {
    return new Rect(this.x1, this.y1 - padding, this.x2, this.y1);
  }

  Rect bottomEdge(float padding) {
    return new Rect(this.x1, this.y2, this.x2, this.y2 + padding);
  }

  boolean pointInRect(float x, float y) {
    return (x >= this.x1 && x <= this.x2 && y >= this.y1 && y <= this.y2);
  }
}
