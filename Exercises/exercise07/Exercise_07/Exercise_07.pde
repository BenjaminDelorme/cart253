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

void setup() {
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
}
void keyPressed() {
  
   if(keyCode == 32){ //Space 
    toneKick.play();
  }if(keyCode == 77){ // M
    toneSnare.play(); 
  }if(keyCode == 79){ //O
    toneHihat.play();
  }if(keyCode == 80){ //P
    toneHihatOpen.play();
  }if(keyCode == 75){ //K
    toneTom1.play();
  }if(keyCode == 76){ //L
    toneTom2.play();
  }if(keyCode == 85){ //U
    toneRide.play();
  }if(keyCode == 73){ //I
    toneCrash.play();
  }if(keyCode == 78){ //N
    toneClap.play();
  }
}