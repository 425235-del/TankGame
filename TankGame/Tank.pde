class Tank {
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;
  int turretCount, laserCount;

  // Constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 2;
    health = 75;
    iTankW = loadImage("tankW.png");
    iTankA = loadImage("tankA.png");
    iTankS = loadImage("tankS.png");
    iTankD = loadImage("tankD.png");
    idir = 'w';
    turretCount = 1;
    laserCount = 10;
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankW, x, y);
    } else if (idir == 'a') {
      image(iTankA, x, y);
    } else if (idir == 's') {
      image(iTankS, x, y);
    } else if (idir == 'd') {
      image(iTankD, x, y);
    }
  }

  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 's') {
      idir = 's';
      y = y + speed;
    } else if (dir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (dir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }
  // Cant figure out
  boolean intersect(Obstacle obs) {
    float distance = dist(x, y, obs.x, obs.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedSide() {
    return x >= width+150 || x <= -150 || y > height + 150 ||  y < - 150;
  }
}
