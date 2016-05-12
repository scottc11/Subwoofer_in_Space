
import ddf.minim.*;
import ddf.minim.analysis.*;

//Declare Global Objects
Minim minim;
AudioPlayer audio;
BeatDetect beatTracker;
Particle particle;

// initalize particle array
ArrayList<Particle> particleArray = new ArrayList<Particle>();
ArrayList<ShadowParticle> shadowParticleArray = new ArrayList<ShadowParticle>();

// init global variables
int numberOfRows = 20; // how many particles to be draw per row/column (Make %)
int pRegSize = 5;  //the smallest a particle is drawn
int pMaxSize = 80; // how large each particle can get

// variable which are used to change location and size of particles (for effect)
float subtractor;
PVector shiftParticleVelocity;

void setup() {
  size(800, 800);
  background(84, 84, 84);
  
  //Setup Minim objects
  minim = new Minim(this);
  audio = minim.loadFile("Let_There_Be_Light.mp3", 1024);
  //audio = minim.loadFile("Kaya.mp3", 1024);
  //audio = minim.loadFile("808_PM_At_The_Beach.mp3", 1024);
  //audio = minim.loadFile("SeeSaw.mp3", 1024);
  audio.loop();
  //audio.mute();
  
  beatTracker = new BeatDetect();
    
  int locX = width/numberOfRows; // where the first particle is drawn
  int locY = height/numberOfRows;
  
  shiftParticleVelocity = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
  
  //create a particle list
  for (int i = 0; i < numberOfRows - 1; i++) {
    // this for loop loops once per row of particles
    for (int j = 0; j < numberOfRows - 1; j++) { 

      particleArray.add(new Particle(locX, locY, 5,pMaxSize, color(173, 255, 47)));
      shadowParticleArray.add(new ShadowParticle(locX, locY, 5, pMaxSize, color(173, 255, 147, 230)));
      locX += width/numberOfRows;
    }
    
    locX = width/numberOfRows;
    locY += height/numberOfRows;
  }
}


void draw() {
  background(0);
  beatTracker.detect(audio.mix);
  
  float value; // the size of ellipse when beat is detected
  
  for (int i = 0; i < particleArray.size(); i++) {
    if (beatTracker.isOnset() == true) {
      
      // below mpas the ellipse size based upon each particles min and max size values(decleared in setup())
      value = map(audio.left.level(), 0, 1, particleArray.get(i).getMinSize(), particleArray.get(i).getMaxSize());
      subtractor = value;
      particleArray.get(i).setScaledSize(value);
      particleArray.get(i).setOriginalLocation();
      particleArray.get(i).setVelocity();
      particleArray.get(i).drawParticle();
      
    } else {

      shadowParticleArray.get(i).setScaledSize(subtractor);
      shadowParticleArray.get(i).drawParticle();
      particleArray.get(i).setScaledSize(pRegSize);
      
      particleArray.get(i).updateLocation();
      particleArray.get(i).drawParticle();
      
      
      if (subtractor > 0.0) {
        subtractor = subtractor - 0.005;
      }
    }
  }
}