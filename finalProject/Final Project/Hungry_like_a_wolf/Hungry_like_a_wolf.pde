//HUNGRY LIKE A WOLF//
//Main page

enum State {
  NONE, 
    TITLE, 
    GAME,
    GAME2,
    GAME3,
    WAVE,
    DEAD
}


//Class creation
State state;
Menus menu;
Wolf wolf;
Sheep[] sheep = new Sheep[10];
UI hp;
UI stamina;
Farmer farmer;
Rabbit[] rabbit = new Rabbit[12];
Wall wall;


//Setting the variables
PImage grass;
PImage test;
PImage night;
float day =4000;
float startGame;
float wave = 7000;
float waveMenuTime=2000;
float timer = 0;
float timer2;
float timerHealth;
float timerLength = 1;
boolean roundOn=false;


//Setup for main program, calling in and loading the classes
void setup() {
  //size(1000,1000);
  fullScreen();
  wolf = new Wolf(width/2, height-100);
  hp = new UI(40, 40, 300);
  stamina = new UI(40, 80, 100);
    for (int i = 0; i < sheep.length; i++) {
  sheep[i] = new Sheep(floor(random(270, 680)), floor(random(40, 260)));
    }
    for (int i = 0; i < rabbit.length; i++) {
  rabbit[i] = new Rabbit(floor(random(0, width)), floor(random(0, height))); }
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
     startGame =millis();
    }
    break;


///////////////////////////////////////////////    WAVE1    /////////////////////////////////////////////// 
  case GAME2:
  //Apply methods and functions for game1 scenario
      timer=millis() - startGame - wave-waveMenuTime;
      roundOn=true;
      image(grass, 0, 0);
      wolf.display();
      wolf.hitBox();
      wolf.update();
      farmer.display();
      farmer.update();
      farmer.route();
      wolf.collision();
      println(timer);
      sheep();
      rabbit();
      
      
      if(roundOn==true){
      dayCycle();
      } else{
       roundOn=false;
      }
      
      //Setting the methods from the UI class
      hp.displayHP();
      hp.updateHP();
      stamina.displayStam();
      stamina.updateStam();
      farmer.sight();
      
     if (timer >= wave && timer <= wave+1000) {
       roundOn=false;
       
  } if (roundOn==false){
    timer2 = millis();
     state = State.WAVE; 
  } 


      if(farmer.lost == true){
       state = State.DEAD;
      }

     
      break;
       ///////////////////////////////////////////////    WAVE2    /////////////////////////////////////////////// 
       case GAME:
  //Apply methods and functions for game1 scenario
      timer=millis() - startGame;
      //timer=millis() - startGame - wave-waveMenuTime;
      roundOn=true;
      image(grass, 0, 0);
      wolf.display();
      wolf.hitBox();
      wolf.update();
      farmer.display();
      farmer.update();
      farmer.route();
      wolf.collision();
      println(timer);
      sheep();
      rabbit();
      
      //Setting background image depending on time of the game(day and night)
      if(roundOn==true){
      dayCycle();
      } else{
       roundOn=false;
      }
      
      //Setting the methods from the UI class
      hp.displayHP();
      hp.updateHP();
      stamina.displayStam();
      stamina.updateStam();
      farmer.sight();
      
     if (timer >= wave && timer <= wave+1000) {
       roundOn=false;
       
  } if (roundOn==false){
    timer2 = millis();
     state = State.WAVE; 
  } 


      if(farmer.lost == true){
       state = State.DEAD;
      }

     
      break;
      case WAVE:
       menu.nextRound();
       if(millis()-timer2 >= waveMenuTime){
         state=State.GAME2;
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
}

void sheep(){
 for (int i = 0; i<sheep.length; i++) {
        sheep[i].display();
        sheep[i].update();
        // Manage if sheep dies
        if (dist(wolf.x, wolf.y, sheep[i].x, sheep[i].y)<30) {
          sheep[i].dies();
          timerHealth = millis();
        }
        //Manage regain health
        if (sheep[i].sheepAlive == false) {
          hp.healthSheep = true;
        } 
        if (hp.healthSheep == true && millis() - timerHealth >= timerLength) {
          hp.healthSheep = false;
        }
      } 
}
void rabbit(){
  for (int i = 0; i<rabbit.length; i++) {
        rabbit[i].display();
        rabbit[i].update();
        rabbit[i].runAway();
        // Manage if rabbit dies
        if (dist(wolf.x, wolf.y, rabbit[i].x, rabbit[i].y)<20) {
          rabbit[i].dies();
          timerHealth = millis();
        }
        if (rabbit[i].rabbitAlive == false) {
          hp.healthRabbit = true;
        } 
        if (hp.healthRabbit == true && millis() - timerHealth >= timerLength) {
          hp.healthRabbit = false;
        }
      
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
     case GAME2:
    menu.keyPressed();
    wolf.keyPressed();
    break;
     case GAME3:
    menu.keyPressed();
    wolf.keyPressed();
    break;
    case WAVE:
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
     case GAME2:
    wolf.keyReleased();
    break;
     case GAME3:
    wolf.keyReleased();
    break;
    case DEAD:
    break;
  }
}