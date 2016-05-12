class ShadowParticle {
  
  int minSize;
  int maxSize;
  int locX;
  int locY;
  float shrinkRate = 0.5;
  float scaledSize;
  color particleColor;
  
  ShadowParticle(int _locX, int _locY, int _minSize, int _maxSize, color _particleColor) {
    locX = _locX;
    locY = _locY;
    minSize = _minSize;
    maxSize = _maxSize;
    particleColor = _particleColor;
  }
  
  void drawParticle() {
    fill(particleColor);
    noStroke();
    ellipse(locX, locY, scaledSize, scaledSize);
  }
  
  // setting the size to scale the ellipse to after each beat is detected
  void setScaledSize(float _scaledSize) {
    scaledSize = _scaledSize;
  }
  
  int getMinSize() {
    return minSize;
  }
  
  int getMaxSize() {
    return maxSize;
  }
  
}