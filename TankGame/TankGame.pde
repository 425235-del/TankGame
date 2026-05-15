// Caleb Taylor | Apr 14 2026 | TankGame
PImage bg, startScreen, gameOver;
Tank tank;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer obsTimer, puTimer;
boolean play;

void setup() {
  size(500, 500);
  play = false;
  startScreen = loadImage("tankgamestart.png");
  bg = loadImage("bg1.png");
  tank = new Tank();
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //obstacles.add(new Obstacle(300,200,100,100, int(random));
}

void draw() {
  if (play == false) {
    startScreen();
  } else {
     imageMode(CORNER);
    image(bg,0,0);
    //Add Timer to distribute obstacles
    if (obsTimer.isFinished()) {
      obstacles.add(new Obstacle(-100, int(random(height))));
      obsTimer.start();
    }
    //powerup timer
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }
    //obstacles.add(new Obstacle(250, 250));
    // Displaying obstacles
    for (int i = 0; i < obstacles.size(); i++) {
      Obstacle obs = obstacles.get(i);
      obs.display();
      obs.move();
      if (obs.reachedSide()) {
        obstacles.remove(i);
      }
      if (tank.intersect(obs)) {
        obstacles.remove(obs);
      }
    }
    // Displaying projectiles
    for (int i = 0; i < projectiles.size(); i++) {
      Projectile p = projectiles.get(i);
      for (int j = 0; j < obstacles.size(); j++) {
        Obstacle obs = obstacles.get(j);
        if (p.intersect(obs)) {
          score = score + 100;
          projectiles.remove(i);
          obstacles.remove(j);
          continue;
        }
      }
      p.display();
      p.move();
      if (p.reachedSide()) {
        projectiles.remove(i);
      }
    }
    // Display and remove power ups
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      pu.display();
      pu.move();
      if (pu.reachedSide()) {
        powerups.remove(pu);
      }
      if (pu.intersect(tank)) {
        if (pu.type == 'h') {
          tank.health = tank.health + 100;
          powerups.remove(pu);
        } else if (pu.type == 'a') {
          tank.laserCount = tank.laserCount + 100;
          powerups.remove(pu);
        } else if (pu.type == 't') {
          tank.turretCount = tank.turretCount + 1;
          powerups.remove(pu);
        }
      }
    }


    tank.display();
    scorePanel();
    println("Objects in Memory:"+obstacles.size());
    println("Projectiles in Memory:"+projectiles.size());
  }
}
void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
  text("Health:" + tank.health, width/2-150, 25);
  text("Ammo:" + tank.laserCount, width/2+150, 25);
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
  float dx = mouseX - tank.x;
  float dy = mouseY - tank.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    if (tank.turretCount == 1) {
      projectiles.add(new Projectile(tank.x-20, tank.y, dx * speed, dy * speed));
    } else if (tank.turretCount==2) {
      projectiles.add(new Projectile(tank.x-20, tank.y, dx * speed, dy * speed));
      //projectiles.add(new Projectile(t1.x-20, t1.y, dx * speed, dy * speed));
    }
    //projectiles.add(new Projectile(t1.x-20, t1.y, dx * speed, dy * speed));
    //println(projectiles.size());


    //  if (t1.turretCount == 1 && t1.laserCount > 0) {
    //    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
    //    t1.laserCount = t1.laserCount - 1;
    //  } else if (t1.turretCount == 2 && t1.laserCount > 2) {
    //    projectiles.add(new Projectile(t1.x-20, t1.y, dx * speed, dy * speed));
    //    projectiles.add(new Projectile(t1.x+20, t1.y, dx * speed, dy * speed));
    //    t1.laserCount = t1.laserCount - 2;
    //  }
    //}
  }
}
void startScreen() {
  image(startScreen, 0, 0);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
}
