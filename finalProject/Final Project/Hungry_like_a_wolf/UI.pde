class UI {
  float x;
  float y;
  float health;
  boolean healthSheep = false;
  boolean healthRabbit = false;
  boolean healthmRabbit = false;



  UI(float tempX, float tempY, float healthBar) {
    x = tempX;
    y = tempY;
    health = healthBar;
  }

  void displayHP() {
    rectMode(CORNER);
    fill(255, 0, 0);
    stroke(2);
    rect(x, y, health, 20);
    fill(0);
    textSize(20);
    text(floor(health), 60, 58);
  }
  void displayStam() {
    rectMode(CORNER);
    fill(0, 0, 255);
    stroke(2);
    rect(x, y, health, 20);
  }
  void updateHP() {
    health = constrain (health, 0, 300);
    if (healthSheep == true) {
      health +=4;
    } else {
      health -=0.05;
    }

    if (healthRabbit == true) {
      health +=2;
    } else {
      health -=0.05;
    }
     if (healthmRabbit == true) {
      health +=10;
    } else {
      health -=0.05;
    }
    
  }
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
  void reset(){
   health = 300; 
   health = -0.5;

  }
}