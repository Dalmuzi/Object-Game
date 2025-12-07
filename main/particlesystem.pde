class ParticleSystem{
  ArrayList<Particle> particles;
  
  ParticleSystem(){
    particles = new ArrayList<Particle>();
    
  }
  //creating burst of particles in the x and y position
  void burst(float x, float y){
    for (int i = 0; i < 20; i++){
      particles.add(new Particle(x, y));
    }
  }
  //displaying the particles in the centre of the scope point
  void ParticleDisplay(){
    for (int i = particles.size() - 1; i >= 0; i--){
      Particle p = particles.get(i);
      p.update();
      p.display();
      if(p.vanish()){
        particles.remove(i);
      }
    }
  }// clearing all particles
  void clear(){
    particles.clear();
  }
  
}
