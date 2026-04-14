// Caleb Taylor | Apr 14 2026 | TankGame
PImage bg;
Tank tank;

void setup() {
   size(500,500);
   bg = loadImage("bg1.png");
   tank = new Tank();
}
 
  
void draw() {
  background(127);
  imageMode(CORNER);
  image(bg,0,0);
  tank.display();
}

void keyPressed() {
  if(keyCode == RIGHT); {
  tank.move();
  // if (y<0) {
  //  y = height;
  //}
  //if (y>height) {
  //  y = 0;
  //}
  //if (x<0) {
  //  x = width;
  //}
  //if (x>width) {
  //  x = 0;
  //}
  //if (key == 'w' || key == 'W') {
  //  y = y - 10;
  //} else if (key == 's' || key == 'S') {
  //  y = y + 10;
  //} else if (key == 'a' || key == 'A') {
  //  x = x - 10;
  //} else if (key == 'd' || key == 'D') {
  //  x = x + 10;
  //}
  }
}
 
