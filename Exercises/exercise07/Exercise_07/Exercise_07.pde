import processing.sound.*;
SoundFile toneKick;
SoundFile toneSnare;
SoundFile toneHihat;
SoundFile toneHihatOpen;
SoundFile toneTom1;
SoundFile toneTom2;
SoundFile toneRide;
SoundFile toneCrash;
SoundFile toneClap;
PImage drum;

void setup() {
  size(846,507);
  drum = loadImage("images/Drum.png");
  toneKick = new SoundFile(this, "sounds/kick.wav");
  toneSnare = new SoundFile(this, "sounds/snare.wav");
  toneHihat = new SoundFile(this, "sounds/hihat.wav");
  toneHihatOpen = new SoundFile(this, "sounds/hihatOpen.wav");
  toneTom1 = new SoundFile(this, "sounds/tom1.wav");
  toneTom2 = new SoundFile(this, "sounds/tom2.wav");
  toneRide = new SoundFile(this, "sounds/ride.wav");
  toneCrash = new SoundFile(this, "sounds/crash.wav");
  toneClap = new SoundFile(this, "sounds/clap.wav");
}
void draw() {
   image(drum,0,0);
}
void keyPressed() {
  
   if(keyCode == 32){ //Space 
    toneKick.play();
    toneKick.amp(0.5);
  }if(keyCode == 77){ // M
    toneSnare.play(); 
  }if(keyCode == 79){ //O
    toneHihat.play();
  }if(keyCode == 80){ //P
    toneHihatOpen.play();
    toneHihatOpen.amp(0.5);
  }if(keyCode == 75){ //K
    toneTom1.play();
    toneTom1.amp(0.5);
  }if(keyCode == 76){ //L
    toneTom2.play();
    toneTom2.amp(0.5);
  }if(keyCode == 85){ //U
    toneRide.play();
  }if(keyCode == 73){ //I
    toneCrash.play();
  }if(keyCode == 78){ //N
    toneClap.play();
    toneClap.amp(0.5);
  }
}