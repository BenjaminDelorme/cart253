
///////////////////////////////////////////////   CLASS MENUS   /////////////////////////////////////////////// 


class Menus {
  
  ///////PROPRETIES////////
  String wave2 = "Wave 2";
  String wave3 = "Wave 3";
  String dead = "You are dead";
  String title = "Click any key to play";
  boolean clickTitle = false;
  boolean clickWave = false;
  boolean timeWaveM;
  float timerL = 2000;
  float timer=0;
  
    ///////METHODS////////
  Menus() {
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
    background(0);
    textAlign(CENTER);
    text(dead, width/2, height/2);
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