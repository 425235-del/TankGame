// Caleb Taylor | Apr 14 2026 | TankGame
PImage bg;
Tank tank;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank = new Tank();
  obstacles.add(new Obstacle(250, 250));
  obstacles.add(new Obstacle(40, 444));
  obstacles.add(new Obstacle(400, 25));
}


void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);

  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
  }


  tank.display();
}

void keyPressed() {
  if (key == 'w') {
    tank.move('w');
  } else if (key == 's') {
    tank.move('s');
  } else if (key == 'd') {
    tank.move('d');
  } else if (key == 'a') {
    tank.move('a');
  }
}
