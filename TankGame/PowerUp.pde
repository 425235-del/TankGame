class PowerUp {
  int x, y, w, h, speed;
  char type;
  //PImage obst1;
  //char idir;

  // Constructor
  PowerUp(int x, int y) {
    this.x  = x;
    this.y = y;
    w = 100;
    h = 100;
    speed = 2;
    if (random(4) == 2) {
      type = 'h';
    } else if (random(2) == 1) {
      type = 't';
    } else {
      type = 'a';
    }
  }

  void display() {
    if (type == 'a') {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Ammo", x, y);
    } else  if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
    } else  if (type == 't') {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
    }
    //imageMode(CENTER);
    //image(obst1, x, y);
  }

  void move() {
    y = y + speed;
  }
}
