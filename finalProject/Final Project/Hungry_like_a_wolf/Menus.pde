class Menus {
  int waveN =0;
  String dead = "You are dead";
  String title = "Click any key to play";
  String nextRound = "Wave " + waveN;
  boolean clickTitle = false;
  boolean clickWave = false;
  boolean timeWaveM;
  float timerL = 2000;
  float timer=0;
  Menus() {
  }

  void title() {
    background(255);
    textAlign(CENTER);
    textSize(40);
    fill(0);
    text(title, width/2, height/2);
  }

  void mainMenu() {
    background(0, 250, 0);
  }

  void dead() {
    background(0);
    textAlign(CENTER);
    text(dead, width/2, height/2);
  }

  void nextRound() {
    timer = millis();
    background(0);
    fill(250);
    textAlign(CENTER);
    text(nextRound, width/2, height/2);
    waveN +=1;
    } 






  void keyPressed() {
    if (keyPressed) {
      clickTitle = true;
    }

  }

  void keyReleased() {
  }
}