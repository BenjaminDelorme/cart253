
///////////////////////////////////////////////   CLASS MENUS   /////////////////////////////////////////////// 


class Menus {
  
  ///////PROPRETIES////////
  String wave2 = "Wave 2";
  String wave3 = "Wave 3";
  String title = "Click any key to play";
  boolean clickTitle = false;
  boolean clickWave = false;
  boolean timeWaveM;
  float timerL = 2000;
  float timer=0;
  
  PImage win;
  PImage dead;
  
  ////Loading the images
    ///////METHODS////////
  Menus() {
   win = loadImage("images/win.png");
  dead = loadImage("images/dead.png");
  
  win.resize(width,height);
  dead.resize(width,height);
  }

  void title() {
    background(255);
    textAlign(CENTER);
    textSize(40);
    fill(0);
    text(title, width/2, height/2);
  }

/////Screen for the main menu (title screen)
  void mainMenu() {
    background(0, 250, 0);
  }

/////Screen for the death menu (when you die)
  void dead() {
    image(dead,0,0);
  }
void win(){
   image(win,0,0);
}

/////Screens for the wave title-when you switch round
    void wave2() {
    timer = millis();
    background(0);
    fill(250);
    textAlign(CENTER);
    text(wave2, width/2, height/2);
    } 
    void wave3() {
    timer = millis();
    background(0);
    fill(250);
    textAlign(CENTER);
    text(wave3, width/2, height/2);
    } 





///////KEY RELATED/////
///KeyPressed for the title screen
  void keyPressed() {
    if (keyPressed) {
      clickTitle = true;
    }

  }

  void keyReleased() {
  }
}