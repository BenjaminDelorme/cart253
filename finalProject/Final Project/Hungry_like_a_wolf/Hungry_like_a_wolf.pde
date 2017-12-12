import processing.sound.*;

//HUNGRY LIKE A WOLF//

    ///////////////////////////////////////////////    STATES    /////////////////////////////////////////////// 

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
   ///////////////////////////////////////////////    IMPORT SOUNDS    /////////////////////////////////////////////// 

SoundFile howl;
SoundFile step;
SoundFile sheepBeh;
SoundFile bunny;
SoundFile chomp;
SoundFile daySFX;
SoundFile gun;
SoundFile music;

   ///////////////////////////////////////////////   CREATE CLASSES    /////////////////////////////////////////////// 

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


    ///////////////////////////////////////////////    VARIABLES    /////////////////////////////////////////////// 
    ////Images
PImage grass;
PImage nulll;
PImage  days;
PImage night;
    ////Floats
float day =40000;
float startGame;
float wave = 60000;
float waveMenuTime=2000;
float timer = 0;
float timer2;
float timerLength = 1;

String BG = "BG";

boolean roundOn=false;


    ///////////////////////////////////////////////    SETUP    /////////////////////////////////////////////// 
    
    ////Sounds, loading the sounds with their given variables
void setup() {
  //size(1000, 1000);
  fullScreen();
  //loading all the sounds//
  howl = new SoundFile(this, "sounds/howling.mp3");
  step = new SoundFile(this, "sounds/walk.mp3");
  sheepBeh= new SoundFile(this, "sounds/sheep.mp3");
  bunny = new SoundFile(this, "sounds/screech.mp3");
  chomp = new SoundFile(this, "sounds/chomp.mp3");
  daySFX = new SoundFile(this, "sounds/day.mp3");
  gun = new SoundFile(this, "sounds/gun.mp3");
  music = new SoundFile(this, "sounds/music.mp3");
  music.amp(0.1);
  chomp.amp(0.1);
  daySFX.amp(0.5);
  
    ////Classes, loading the classes with their given variables
  wolf = new Wolf(width/2, height-100);
  hp = new UI(40, 40, 300);
  stamina = new UI(40, 80, 100);
  for (int i = 0; i < sheep.length; i++) {
    sheep[i] = new Sheep(floor(random(270, 680)), floor(random(40, 260)));
  }
  for (int i = 0; i < rabbit.length; i++) {
    rabbit[i] = new Rabbit(floor(random(0, width)), floor(random(0, height)));
  }
  mRabbit = new Rabbit(floor(random(width/2, width)), floor(random(height/2, height)));
  farmer = new Farmer(400, 400);
  farmer2 = new Farmer(width/2, height/2);
  menu = new Menus();
      ////Images, loading the images with their given variables
  grass = loadImage("data/images/grass2.png");
  days = loadImage("data/images/BG.png");
  night = loadImage("data/images/BG_1.png");
  
      ////Start
  state = State.TITLE;
  howl.play(1, 0.2);
}

    ///////////////////////////////////////////////    DRAW    /////////////////////////////////////////////// 

//Setting everything in the draw loop, categorized by each state that's happening
void draw() {

  switch (state) {

  case NONE:
    break;

///Title state: loading the title screen and applying the desired effect when triggered(keyPressed)
  case TITLE:
    menu.title();    
    if (menu.clickTitle) {
      state= State.GAME;
      startGame =millis();
      music.play();
      daySFX.play();
    }
    break;



//////////////Game(s) states: loading everything for all three waves of the game
///////////////////////////    WAVE1    //////////////////////////////////
  case GAME:
    //Apply methods and functions for game 1 scenario
    timer=millis() - startGame;
    roundOn=true;
    image(grass, 0, 0);
    wolf.display();
    wolf.hitBox();
    wolf.update();
    farmer.display();
    farmer.update();
    farmer.route();
    farmer.turnAround();
    farmer.sightAround();
    wolf.collision();
    sheep();
    rabbit();
    magicRabbit();
    mRabbit.y = constrain(mRabbit.y, height/2, height);

    //Setting background image depending on time of the game(day and night)
    if (roundOn==true) {
      dayCycle();
    } else {
      roundOn=false;
    }

    //Setting the methods from the UI class
    hp.displayHP();
    hp.updateHP();
    stamina.displayStam();
    stamina.updateStam();
    // Setting the necessary so when the wave(round) ends, it goes to the wave 2 screen
    if (timer >= wave && timer <= wave+1000) {
      roundOn=false;
    } 
    if (roundOn==false) {
      timer2 = millis();
      daySFX.stop();
      state = State.WAVE;
    } 
    
   //Setting the necessary so the game know when you're dead and it switches to the death screen
  if(hp.health<=0){
    state = State.DEAD;
  }

    if (farmer.lost == true || farmer2.lost==true) {
      state = State.DEAD;
    }


    break;
    
    
    ///////////////////////////////////////////////    WAVE2    /////////////////////////////////////////////// 
  case GAME2:
    //Apply methods and functions for game2 scenario(+1 farmer,reset time et less animals)
    timer=millis() - startGame - wave-waveMenuTime;
    roundOn=true;
     println(timer);
    image(grass, 0, 0);
    wolf.display();
    wolf.hitBox();
    wolf.update();
    wolf.collision();
    farmer.display();
    farmer.update();
    farmer.route();
    farmer.sightAround();
    farmer.turnAround();
    farmer2.turnAround();
    farmer2.display();
    farmer2.updateAround();
    farmer2.sightAround();
    sheep2();
    rabbit2();
    magicRabbit2();
    mRabbit.y = constrain(mRabbit.y, height/2, height);
        //Setting background image depending on time of the game(day and night)
    if (roundOn==true) {
      dayCycle();
    } else {
      roundOn=false;
    }

    //Setting the methods from the UI class
    hp.displayHP();
    hp.updateHP();
    stamina.displayStam();
    stamina.updateStam();

    // Setting the necessary so when the wave(round) ends, it goes to the wave 3 screen
    if (timer >= wave && timer <= wave+1000) {
      roundOn=false;
    } 
    if (roundOn==false) {
      timer2 = millis();
      daySFX.stop();
      state = State.WAVE2;
    } 

    //Setting the necessary so the game know when you're dead and it switches to the death screen
    if(hp.health<=0){
    state = State.DEAD;
  }
    if (farmer.lost == true || farmer2.lost==true) {
      state = State.DEAD;
    }

    break;
    
    
    
    ///////////////////////////////////////////////    WAVE3    /////////////////////////////////////////////// 
  case GAME3:
    //Apply methods and functions for game3 scenario (Reset time et less animals)
    timer=millis() - startGame - wave*2 -waveMenuTime*2;
    //println(timer);
    roundOn=true;
    image(grass, 0, 0);
    wolf.display();
    wolf.hitBox();
    wolf.update();
    farmer.display();
    farmer.update();
    farmer.route();
    farmer.sightAround();
    farmer.turnAround();
    farmer2.turnAround();
    farmer2.display();
    farmer2.updateAround();
    farmer2.sightAround();
    wolf.collision();
    sheep3();
    rabbit3();
    magicRabbit3();
    mRabbit.y = constrain(mRabbit.y, height/2, height);
    
     //Setting background image depending on time of the game(day and night)
    if (roundOn==true) {
      dayCycle();
    } else {
      roundOn=false;
    }

    //Setting the methods from the UI class
    hp.displayHP();
    hp.updateHP();
    stamina.displayStam();
    stamina.updateStam();
    
     // Setting the necessary so when the wave(round) ends, it goes to the winning screen( CUZ YOU WON =) )
    if (timer >= wave && timer <= wave+1000) {
      roundOn=false;
    } 
    if (roundOn==false) {
      timer2 = millis();
      daySFX.stop();
      state = State.WON;
    } 

    //Setting the necessary so the game know when you're dead and it switches to the death screen
    if(hp.health<=0){
    state = State.DEAD;
  }
    if (farmer.lost == true || farmer2.lost==true) {
      state = State.DEAD;
    }

    break;




  ////// //////////////////////         WAVE MENUS       /////////////////////////////////
  //wave 2: resets wolf location, background sfx, health and after 2sec, send to game 2 state
  case WAVE:
    menu.wave2();
    if (millis()-timer2 >= waveMenuTime) {
      hp.health = 300;
      wolf.x = width/2;
      wolf.y = height-100;
      wolf.speed = 0;
      wolf.turnSpeed=0;
      daySFX.play();
      state=State.GAME2;
    }
    break;
    
    
  //wave 3: resets wolf location, background sfx, health and after 2sec, send to game 3 state
  case WAVE2:
    menu.wave3();
    if (millis()-timer2 >= waveMenuTime) {
      hp.health = 300;
      wolf.x = width/2;
      wolf.y = height-100;
      wolf.speed = 0;
      wolf.turnSpeed=0;
      daySFX.play();
      state=State.GAME3;
    }
    break;
    
    
    //Appears when you die/lose the game
  case DEAD:
    menu.dead();
    break;
    
    
    //Appears when you win the game
  case WON:
    background(0, 255, 0);
    break;
  }
}




//DayCycle function, to manage the timer/day n night background
void dayCycle() {
  if (timer<=day) {
    nulll=days;
  } else {
    nulll = night;
  }
  image(nulll, 0, 0);
}





////////////////////////////////////    SHEEP FUNCTIONS   ////////////////////////////////////////
//3 times to reset the number every time(Call in different function each wave)
void sheep() {
  for (int i = 0; i<sheep.length; i++) {
    sheep[i].display();
    sheep[i].update();
    // Manage if sheep dies(remove display+gain health)
    if (dist(wolf.x, wolf.y, sheep[i].x, sheep[i].y)<25 &&sheep[i].sheepAlive) {
      sheep[i].dies();
    }
  }
}
void sheep2() {
  for (int i = 0; i<10; i++) {
    sheep[i].display();
    sheep[i].update();
    // Manage if sheep dies
    if (dist(wolf.x, wolf.y, sheep[i].x, sheep[i].y)<25 &&sheep[i].sheepAlive) {
      sheep[i].dies();
    }
  }
}
void sheep3() {
  for (int i = 0; i<6; i++) {
    sheep[i].display();
    sheep[i].update();
    // Manage if sheep dies
    if (dist(wolf.x, wolf.y, sheep[i].x, sheep[i].y)<25 &&sheep[i].sheepAlive) {
      sheep[i].dies();
    }
  }
}


///////////////////////////////    RABBIT FUNCTIONS    /////////////////////////////////// 
//3 times to reset the magical rabbit every time(Call in different function each wave)
void magicRabbit() {
  mRabbit.mDisplay();
  mRabbit.update(); 
   // Manage if magical bunny dies(remove display+gain health)
  if (dist(wolf.x, wolf.y, mRabbit.x, mRabbit.y)<20 && mRabbit.rabbitAlive) {
    mRabbit.diesM();
  }
}
void magicRabbit2() {
  mRabbit.mDisplay();
  mRabbit.update(); 
  if (dist(wolf.x, wolf.y, mRabbit.x, mRabbit.y)<20&& mRabbit.rabbitAlive) {
    mRabbit.diesM();
  }
}
void magicRabbit3() {
  mRabbit.mDisplay();
  mRabbit.update(); 
  if (dist(wolf.x, wolf.y, mRabbit.x, mRabbit.y)<20 &&mRabbit.rabbitAlive) {
    mRabbit.diesM();
  }
}



//3 times to reset the number of rabbit every time(Call in different function each wave)
void rabbit() {
  for (int i = 0; i<rabbit.length; i++) {
    rabbit[i].display();
    rabbit[i].update();
    rabbit[i].runAway();
    // Manage if rabbit dies(remove display + gain health)
    if (dist(wolf.x, wolf.y, rabbit[i].x, rabbit[i].y)<23&&rabbit[i].rabbitAlive) {
      rabbit[i].dies();
    }
  }
}
void rabbit2() {
  for (int i = 0; i<11; i++) {
    rabbit[i].display();
    rabbit[i].update();
    rabbit[i].runAway();
    // Manage if rabbit dies
    if (dist(wolf.x, wolf.y, rabbit[i].x, rabbit[i].y)<23&&rabbit[i].rabbitAlive) {
      rabbit[i].dies();
    }
  }
}
void rabbit3() {
  for (int i = 0; i<8; i++) {
    rabbit[i].display();
    rabbit[i].update();
    rabbit[i].runAway();
    // Manage if rabbit dies
    if (dist(wolf.x, wolf.y, rabbit[i].x, rabbit[i].y)<20&&rabbit[i].rabbitAlive) {
      rabbit[i].dies();
    }
  }
}

///////////////////////////////////////////////   KEYPRESSED    /////////////////////////////////////////////// 


//Applying the keyPressed methods for wolf and menus for each state
void keyPressed() {
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



///////////////////////////////////////////////   KEYRELEASED   /////////////////////////////////////////////// 
//Applying the keyReleased methods for wolf and menus for each state
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