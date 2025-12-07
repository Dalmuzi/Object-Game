class Scope{
  PVector pos;
  
  Scope(){
    pos = new PVector(width/2, height/2);
  
  }
  
  void update(){
    float directionx = (pmouseX - mouseX) * 0.5;
    float directiony = (pmouseY - mouseY) * 0.5;
    
    worldOffset.x += directionx;
    worldOffset.y += directiony;
  }
  
  void display(){
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(pos.x, pos.y, 350, 350);
    line(pos.x - 150, pos.y, pos.x + 150, pos.y);
    line(pos.x, pos.y - 150, pos.x, pos.y + 150);
    
    fill(0);
    noStroke();
    ellipse(pos.x, pos.y, 8, 8);
  }
}
