

class Particle {
  
  int minSize;
  int maxSize;
  PVector originalLocation;
  PVector location;
  PVector velocity;
  int shrinkRate = 1;
  float scaledSize;
  color particleColor;
  
  Particle(int _locX, int _locY, int _minSize, int _maxSize, color _particleColor) {
    location = new PVector(_locX, _locY);
    originalLocation = new PVector(_locX, _locY);
    velocity = new PVector(random(-0.2, 0.2), random(-0.2, 0.2));
    minSize = _minSize;
    maxSize = _maxSize;
    particleColor = _particleColor;
  }
  
  void drawParticle() {
    fill(particleColor);
    noStroke();
    ellipse(location.x, location.y, scaledSize, scaledSize);
  }
  
  void updateLocation() {
    location.add(velocity);
  }
  
  void setOriginalLocation() {
    location.set(originalLocation);
  }
  
  void setVelocity() {
    velocity.set(random(-0.2, 0.2), random(-0.2, 0.2));
  }
  
  // setting the size to scale the ellipse after each beat is detected
  void setScaledSize(float _scaledSize) {
    scaledSize = _scaledSize;
  }
  
  // RETURN METHODS
  int getMinSize() {
    return minSize;
  }
  
  int getMaxSize() {
    return maxSize;
  }
  
  PVector getLocation() {
    return location;
  }
  
}