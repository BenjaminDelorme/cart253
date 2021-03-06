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

HighPass highpass;

PImage drum;
int opacity = 80;



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
  highpass = new HighPass(this);
 
  
}
void draw() {
     image(drum,0,0);
}


void keyPressed() {
  if(keyCode == 17 && keyCode == 32){
   toneKick.play();
    highpass.process(toneKick,5000);
    toneKick.amp(0.7);
    noStroke();
    fill(255,0,0);
    rect(414,247,30,150);
  }
   if(keyCode == 32){ //Space 
    toneKick.play();
   
    toneKick.amp(0.7);
    noStroke();
    fill(255,0,0);
    rect(414,247,30,150);
    
    
  }
  if(keyCode == 77){ // M
    toneSnare.play();
    noStroke();
    fill(26,172,57);
    ellipse(258,287,170,170);
  }
  if(keyCode == 79){ //O
    toneHihat.play();
    noStroke();
    fill(0,139,239);
    ellipse(140,342,180,180); 
  }
  if(keyCode == 80){ //P
    toneHihatOpen.play();
    toneHihatOpen.amp(0.5);
    noStroke();
    fill(0,139,239);
    ellipse(140,342,180,180);
  }
  if(keyCode == 75){ //K
    toneTom1.play();
    toneTom1.amp(0.5);
     noStroke();
    fill(221,146,1);
    ellipse(680,305,210,210);
  }
  if(keyCode == 76){ //L
    toneTom2.play();
    toneTom2.amp(0.5);
    noStroke();
    fill(143,26,233);
    ellipse(513,137,140,140);
  }
  if(keyCode == 73){ //U
    toneRide.play();
    noStroke();
    fill(204,234,6);
    ellipse(677,115,225,225);
  }
  if(keyCode == 85){ //I
    toneCrash.play();
    noStroke();
    fill(251,75,207);
    ellipse(187,130,200,200);
  }
  if(keyCode == 78){ //N
    toneClap.play();
    toneClap.amp(0.5);
    noStroke();
    fill(33,209,161);
    ellipse(348,137,140,140);
  }
}