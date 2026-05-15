class Projectile {
  float x, y, w, h, speed;
  float vx, vy;
  char dir;

 // Constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.w = 10;
    this.h = 10;
    speed = 10;
    dir = 'u';
  }

  void display() {
    fill(255, 40, 200);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }

  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean reachedSide() {
    return x >= width+150 || x <= -150 || y > height + 150 || y < -150;
  }
}
