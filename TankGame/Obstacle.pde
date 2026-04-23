class Obstacle {
  float x, y, w, h, speed, health;
  PImage obst1;
  char idir;

  // Constructor
  Obstacle(float w, float h) {
    this.w  = w;
    this.h = h;
    speed = 3;
    health = 10;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = width+100;
      y = random(height);
    } else {
      idir = 's';
      x= random(height);
      y = -100;
    }
    obst1 = loadImage("obj.png");
  }

  void display() {
    imageMode(CENTER);
    image(obst1, x, y);
  }

  void move() {
    switch(idir) {
    case 'w':
      y = y - speed;
      break;
    case 'a':
      x = x - speed;
      break;
    case 's':
      y = y + speed;
      break;
    case 'd':
      x = x + speed;
      break;
    }
  }
}
