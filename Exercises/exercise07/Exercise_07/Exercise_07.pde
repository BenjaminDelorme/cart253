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