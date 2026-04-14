class Tank {
  int x, y, w, h, speed, health;
  PImage t1;

  // Constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 2;
    health = 100;
    t1 = loadImage("Tank,png");
  }

  void display() {
    imageMode(CENTER);
    image(t1, x, y);
  }

  void move() {
    x = x + speed;
  }
}
