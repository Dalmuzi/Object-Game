//Danny Kim Object Oriented Game Assignment

import processing.sound.*; // Importing Sound Library
ArrayList<Target> targets; 
Scope scope;

int score = 0; //Player Score
int hp = 5; // Player HP
boolean playing = true; // 
PVector camera; //The main camera movement

ParticleSystem ps;
float speedMultiplier = 1;
SoundFile soundEffect;

void setup() {
  size(400, 400);
  soundEffect = new SoundFile(this, "Gunshot Sound Effect.wav"); //Loading the sound file
  //game objects
  targets = new ArrayList<Target>();
  scope = new Scope();
  ps = new ParticleSystem(); 
  camera = new PVector(0, 0);

  for (int i = 0; i < 5; i++) {
    targets.add(new Target());
  }
}

void draw() {
  background(40);

  if (playing) {
    playGame();
  } else {
    gameOver();
  }
}

void playGame() {
  scope.update();
  
  pushMatrix();
  
  translate(camera.x, camera.y);
  
  for (Target t : targets) {
    t.update();
    t.display();
  }

  popMatrix();

  scope.display();

  drawHPBullets();
  
  ps.ParticleDisplay();
  
  fill(255);
  text("Score: " + score, 10, 20);

  if (frameCount % 130 == 0) {
    targets.add(new Target());
  }

  if (hp <= 0) {
    playing = false;
  }
}

//This allows the player to hit the targets or miss the targets and lose a life. 
void mousePressed() {
  soundEffect.play();
  if (!playing) return;

  boolean hit = false;
  float sx = width / 2;
  float sy = height / 2;
  float scopeRadius = 75;  
  float hitZone = 20;     

  for (int i = targets.size() - 1; i >= 0; i--) {
    Target t = targets.get(i);
    float wx = t.pos.x + camera.x;
    float wy = t.pos.y + camera.y;
    float d = dist(wx, wy, sx, sy);

    if (d < scopeRadius && d < hitZone) {
      score++;

      hit = true;

      targets.remove(i);
      //Everytime the player hits 5 targets, the speed of the targets increase for higher difficulty
      if (score % 5 == 0) {
        speedMultiplier += 0.4;
      }
      
      ps.burst(sx,sy);
    }
  }
//This reduces the health of the player when they miss the shot of the targets.
  if (!hit) {
    hp--;
  }
}

//HP bar which are like bullets for visual approvements
void drawHPBullets() {
  for (int i = 0; i < hp; i++) {
    fill(255, 220, 0);
    rect(10 + i * 20, 50, 15, 35, 4);
  }
}

//Key press mechanic to restart the game when the game is over
void keyPressed() {
  if (!playing && key == 'r') {
    restart();
  }
}

//resets the whole game to default state
void restart() {
  targets.clear();
  for (int i = 0; i < 5; i++) {
    targets.add(new Target());
  }

  score = 0;
  hp = 5;
  speedMultiplier = 1;
  camera.set(0, 0);
  ps.clear();

  playing = true;
}

//Game Over Screen when the player runs out of health
void gameOver() {
  background(0);

  fill(255);
  textAlign(CENTER);
  textSize(32);
  text("GAME OVER", width/2, height/2 - 20);

  textSize(20);
  text("Press R to Restart", width/2, height/2 + 20);
}
