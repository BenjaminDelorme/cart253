
///////////////////////////////////////////////   CLASS User Interface (UI)    /////////////////////////////////////////////// 
///Health bar & Stamina Bar

class UI {
  
    ///////PROPRETIES////////
  float x;
  float y;
  float health;


    ///////METHODS////////

  UI(float tempX, float tempY, float healthBar) {
    x = tempX;
    y = tempY;
    health = healthBar;
  }
  
///Displays the health bar at its location(red, top left corner)and display the number related to the health of the wolf
  void displayHP() {
    rectMode(CORNER);
    fill(255, 0, 0);
    stroke(2);
    rect(x, y, health, 20);
    fill(0);
    textSize(20);
    text(floor(health), 60, 58);
  }
  
 ///Displays the stamina bar underneath the health bar (in blue)
  void displayStam() {
    rectMode(CORNER);
    fill(0, 0, 255);
    stroke(2);
    rect(x, y, health, 20);
  }
  
  ////Updates the health bar so it's goes down throughout the game (if not regain by eating animals)
  void updateHP() {
    health = constrain (health, 0, 300);
    health -=0.185;
  }
  
  //Updates the stamina bar related to the sprint of the wolf(if he sprints,it goes down, else it ges up/ if reaches 0, the wolf stops running)
  void updateStam() {
    health = constrain (health, 0, 100);

    if (wolf.sprint == true) {
      health -=2;
      timer = millis();
    } else if(health<100 && millis() - timer >= timerLength){
      health +=0.4;
    } if(health <10){
     wolf.sprint=false; 
    }
  }

}