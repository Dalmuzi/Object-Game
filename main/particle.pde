class Particle{
  PVector pos; //particle position
  PVector vel; //particle velocity
  float fade; //value for the particles to fade away
  
  Particle(float x, float y){
    pos = new PVector(x, y);
    
    vel = PVector.random2D(); //random directions for the particles to spread
    vel.mult(random(2,5)); //random speed of the particles
    
    fade = 255;
  }
  
  //updating the position and fades
  void update(){
    pos.add(vel);
    fade -=5;
  }
  
  //displaying the particles as small circles
  void display(){
    noStroke();
    fill(255, fade);
    ellipse(pos.x, pos.y, 5, 5);
  }
  //return true if particle should be removed
  boolean vanish(){
    return fade <= 0;
  }
  
}
