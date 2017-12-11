//HUNGRY LIKE A WOLF//
//Main page
enum State {
  NONE, 
    TITLE, 
    GAME,
    GAME2,
    GAME3,
    WAVE,
    WAVE2,
    DEAD,
    WON
}

//Class creation
State state;
Menus menu;
Wolf wolf;
Sheep[] sheep = new Sheep[10];
UI hp;
UI stamina;
Farmer farmer;
Farmer farmer2;
Rabbit[] rabbit = new Rabbit[12];
Rabbit mRabbit;
Wall wall;


//Setting the variables
PImage grass;
PImage nulll;
PImage  days;
PImage night;
float day =4000;
float startGame;
float wave = 7000;
float waveMenuTime=2000;
float timer = 0;
float timer2;
float timerHealth;
float timerLength = 0.5;
String BG = "BG";
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
  mRabbit = new Rabbit(floor(random(width/2, width)), floor(random(height/2, height)));
  farmer = new Farmer(300, 400);
  farmer2 = new Farmer(width/2, height/2);
  menu = new Menus();
  wall = new Wall();
  grass = loadImage("data/images/grass2.png");
  days = loadImage("data/images/BG.png");
  night = loadImage("data/images/BG_1.png");
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
      farmer.turnAround();
      farmer.sight();
      farmer.turnAround();
      
      wolf.collision();
      sheep();
      rabbit();
      magicRabbit();
      mRabbit.y = constrain(mRabbit.y,height/2,height);
      
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
      
     if (timer >= wave && timer <= wave+1000) {
       roundOn=false;
       
  } if (roundOn==false){
    timer2 = millis();
     state = State.WAVE; 
  } 


      if(farmer.lost == true || farmer2.lost==true){
       state = State.DEAD;
      }

     
      break;
       ///////////////////////////////////////////////    WAVE2    /////////////////////////////////////////////// 
    
      case GAME2:
  //Apply methods and functions for game2 scenario
      timer=millis() - startGame - wave-waveMenuTime;
      roundOn=true;
      image(grass, 0, 0);
      wolf.display();
      wolf.hitBox();
      wolf.update();
      wolf.collision();
      farmer.display();
      farmer.update();
      farmer.route();
      farmer.sight();
      farmer.turnAround();
      farmer2.turnAround();
      farmer2.display();
      farmer2.updateAround();
      farmer2.sightAround();
      sheep2();
      rabbit2();
      magicRabbit2();
      mRabbit.y = constrain(mRabbit.y,height/2,height);
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

      
     if (timer >= wave && timer <= wave+1000) {
       roundOn=false;
       
  } if (roundOn==false){
    timer2 = millis();
     state = State.WAVE2; 
  } 

    //Goes to death screen if farmer sees you (YOU LOSE THE GAME)
      if(farmer.lost == true || farmer2.lost==true){
       state = State.DEAD;
      }

      break;
        ///////////////////////////////////////////////    WAVE3    /////////////////////////////////////////////// 
    
      case GAME3:
  //Apply methods and functions for game3 scenario
      timer=millis() - startGame - wave*2 -waveMenuTime*2;

      roundOn=true;
      image(grass, 0, 0);
      wolf.display();
      wolf.hitBox();
      wolf.update();
      farmer.display();
      farmer.update();
      farmer.route();
      farmer.sight();
      farmer.turnAround();
      farmer2.turnAround();
      farmer2.display();
      farmer2.updateAround();
      farmer2.sightAround();
      wolf.collision();
      sheep3();
      rabbit3();
      magicRabbit3();
      mRabbit.y = constrain(mRabbit.y,height/2,height);
      
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
      
     if (timer >= wave && timer <= wave+1000) {
       roundOn=false;
       
  } if (roundOn==false){
    timer2 = millis();
     state = State.WON; 
  } 

    //Goes to death screen if farmer sees you (YOU LOSE THE GAME)
      if(farmer.lost == true || farmer2.lost==true){
       state = State.DEAD;
      }

      break;
      
      
      
     ///////////////// /////////////////////////////         WAVE MENUS       //////////////////////////////////////////////
      case WAVE:
       menu.nextRound();
       if(millis()-timer2 >= waveMenuTime){
           hp.health = 300;
           wolf.x = width/2;
           wolf.y = height-100;
           wolf.speed = 0;
           wolf.turnSpeed=0;
         state=State.GAME2;
       }
  
      break;
      case WAVE2:
       menu.nextRound();
       if(millis()-timer2 >= waveMenuTime){
           hp.health = 300;
           wolf.x = width/2;
           wolf.y = height-100;
           wolf.speed = 0;
           wolf.turnSpeed=0;
         state=State.GAME3;
       }
 
  
      break;
      case DEAD:
      
      menu.dead();
      break;
      
      case WON:
      background(0,255,0);
      break;
  }
}



//DayCycle function, to manage the timer/day n night background

void dayCycle() {
  if (timer>= 0 && timer<=day) {
       nulll=days;}
       else{
    nulll = night;
  }
      image(nulll, 0, 0);
}




   ///////////////////////////////////////////////    SHEEP FUNCTIONS   /////////////////////////////////////////////// 
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
}void sheep2(){
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
void sheep3(){
 for (int i = 0; i<5; i++) {
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
   ///////////////////////////////////////////////    RABBIT FUNCTIONS    /////////////////////////////////////////////// 
 void magicRabbit(){
  mRabbit.mDisplay();
  mRabbit.update(); 
   if (dist(wolf.x, wolf.y, mRabbit.x, mRabbit.y)<20) {
          mRabbit.dies();
          timerHealth = millis();
        }
        if (mRabbit.rabbitAlive == false) {
          hp.healthRabbit = true;
        } 
        if (hp.healthRabbit == true && millis() - timerHealth >= timerLength) {
          hp.healthRabbit = false;
        }
 }
  void magicRabbit2(){
  mRabbit.mDisplay();
  mRabbit.update(); 
   if (dist(wolf.x, wolf.y, mRabbit.x, mRabbit.y)<20) {
          mRabbit.dies();
          timerHealth = millis();
        }
        if (mRabbit.rabbitAlive == false) {
          hp.healthRabbit = true;
        } 
        if (hp.healthRabbit == true && millis() - timerHealth >= timerLength) {
          hp.healthRabbit = false;
        }
 }
  void magicRabbit3(){
  mRabbit.mDisplay();
  mRabbit.update(); 
   if (dist(wolf.x, wolf.y, mRabbit.x, mRabbit.y)<20) {
          mRabbit.dies();
          timerHealth = millis();
        }
        if (mRabbit.rabbitAlive == false) {
          hp.healthRabbit = true;
        } 
        if (hp.healthRabbit == true && millis() - timerHealth >= timerLength) {
          hp.healthRabbit = false;
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
void rabbit2(){
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
void rabbit3(){
  for (int i = 0; i<7; i++) {
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
     menu.keyReleased();
    break;
     case GAME2:
    wolf.keyReleased();
     menu.keyReleased();
    break;
     case GAME3:
    wolf.keyReleased();
     menu.keyReleased();
    break;
    case DEAD:
    break;
  }
}