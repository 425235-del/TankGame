// Caleb Taylor | Apr 14 2026 | TankGame
PImage bg;
Tank tank;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int score;
Timer obsTimer;

void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank = new Tank();
  //obstacles.add(new Obstacle(250, 250));
  //obstacles.add(new Obstacle(40, 444));
  //obstacles.add(new Obstacle(400, 25));
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
}


void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  //Add Timer to distribute obstacles
  if(obsTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height))));
    obsTimer.start();
  }
  //obstacles.add(new Obstacle(250, 250));
  // Displaying obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
  }
  // Displaying projectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
  }
  tank.display();
  scorePanel();
}

void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 40);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 35);
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

void mousePressed() {
  projectiles.add(new Projectile(tank.x, tank.y));
}
