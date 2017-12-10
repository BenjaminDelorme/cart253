//HUNGRY LIKE A WOLF//
//Main page

enum State {
  NONE, 
    TITLE, 
    GAME,
    DEAD
}
int sheepNb=2;


//Class creation
State state;
Menus menu;
Wolf wolf;
Sheep[] sheep = new Sheep[sheepNb];
UI hp;
UI stamina;
Farmer farmer;
Rabbit[] rabbit = new Rabbit[10];
Wall wall;
//Setting the variables
PImage grass;
PImage test;
PImage night;
int day =4000;
int wave = 7000;
boolean dayTime=false;
boolean nightTime =false;
float transparency = 0;
int timer = 0;
int timeWave=0;
int waveL=2000;
int timerLength = 1;
boolean roundEnd=false;
boolean roundStart=false;

//Setup for main program, calling in and loading the classes
void setup() {
  size(1000,1000);
  //fullScreen();
  wolf = new Wolf(width/2, height-100);
  hp = new UI(40, 40, 300);
  stamina = new UI(40, 80, 100);
  for (int i = 0; i < sheep.length; i++) {
    sheep[i] = new Sheep(floor(random(270, 680)), floor(random(40, 260)),sheepNb);
  }
  for (int i = 0; i < rabbit.length; i++) {
    rabbit[i] = new Rabbit(floor(random(0, width)), floor(random(0, height)));
  }
  farmer = new Farmer(300, 400);
  menu = new Menus();
  wall = new Wall();
  grass = loadImage("data/images/grass2.png");
  test = loadImage("data/images/test.png");
  night = loadImage("images/night.png");

  state = State.TITLE;
}

//Setting the classe's methods in the draw loop
void draw() {

  switch (state) {

  case NONE:
    break;


  case TITLE:
    menu.title();
    if (menu.clickTitle) {
      state= State.GAME;
   
    }
    break;

  case GAME:
      timer=millis();
      roundStart=true;
      dayTime=true;
      nightTime=false;
      image(grass, 0, 0);
      wolf.display();
      wolf.hitBox();
      wolf.update();
      farmer.display();
      farmer.update();
      farmer.route();
      //wall.display();
      wolf.collision();
      println(mouseX, mouseY);


      //For sheep//
      for (int i = 0; i<sheep.length; i++) {
        sheep[i].display();
        sheep[i].update();
        // Manage if sheep dies
        if (dist(wolf.x, wolf.y, sheep[i].x, sheep[i].y)<30) {
          sheep[i].dies();
          timer = millis();
        }
        if (sheep[i].sheepAlive == false) {
          hp.healthSheep = true;
        } 
        if (hp.healthSheep == true && millis() - timer >= timerLength) {
          hp.healthSheep = false;
        }
      }



      //For rabbit
      for (int i = 0; i<rabbit.length; i++) {
        rabbit[i].display();
        rabbit[i].update();
        rabbit[i].runAway();
        // Manage if rabbit dies
        if (dist(wolf.x, wolf.y, rabbit[i].x, rabbit[i].y)<20) {
          rabbit[i].dies();
          timer = millis();
        }
        if (rabbit[i].rabbitAlive == false) {
          hp.healthRabbit = true;
        } 
        if (hp.healthRabbit == true && millis() - timer >= timerLength) {
          hp.healthRabbit = false;
        }
      
      }
      
      if(roundStart==true){
      dayCycle();
      } else{
       roundEnd=true;
      }
      
      //Setting the methods from the UI class
      hp.displayHP();
      hp.updateHP();
      stamina.displayStam();
      stamina.updateStam();
      farmer.sight();
      
     if(roundEnd==true){
       timeWave = millis();
       if(millis()-timeWave <= waveL){
      menu.nextRound();
       }else{
        background(0,255,0); 
       }
    
      
     }
 
     


      if(farmer.lost == true){
       state = State.DEAD;
      }

      
    
      break;
      
      case DEAD:
      
      menu.dead();
      break;
  }
}



void dayCycle() {
    image(test, 0, 0);
  
  if (timer>= day) {
   image(night,0,0);
  }

  if (timer >= wave) {
    roundEnd = true;
  }
}


//Setting the key related methods
void keyPressed(){
  switch (state) {
  case NONE:
    break;

  case TITLE:
    menu.keyPressed();
    break;
  case GAME:
    menu.keyPressed();
    wolf.keyPressed();
    break;
    case DEAD:
    break;
  }
}

void keyReleased() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    menu.keyReleased();
    break;
  case GAME:
    wolf.keyReleased();
    break;
    case DEAD:
    break;
  }
}