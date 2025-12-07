class Particle{
  PVector pos;
  PVector vel;
  float fade;
  
  Particle(float x, float y){
    pos = new PVector(x, y);
    
    vel = PVector.random2D();
    vel.mult(random(2,5));
    
    fade = 255;
  }
  
  void update(){
    pos.add(vel);
    fade -=5;
  }
  
  void display(){
    noStroke();
    fill(255, fade);
    ellipse(pos.x, pos.y, 5, 5);
  }
  
  boolean vanish(){
    return fade <= 0;
  }
  
}
