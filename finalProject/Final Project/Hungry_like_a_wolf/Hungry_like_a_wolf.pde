import processing.sound.*;

//HUNGRY LIKE A WOLF//


    ////////////////////////////////////////////////    ARTIST STATEMENT   //////////////////////////////////////
    
/* Hungry like a wolf is a simple game where you, as a wolf, are hungry and basically try to survive by eating the animals around you, 
especially the farmer’s sheep inside the fence. As this simple explanation of the game may make it look simple, it was actually quite 
a challenge to realize and to code. As someone who had never done any type of coding before, learning this new language was quite a challenge 
for me this semester because I was diving into something completely new. Although the process of learning was long and harsh, I believe it has 
led me to a point where I know a bit what I’m doing and I am proud of it. As I work to program this game, I had to, of course, let go of the 
design/esthetic aspect of it and I had to focus on the programming aspect instead because no matter how pretty your game is, it’s useless if it 
doesn’t work. I also wanted to challenge myself by creating something original/of my own instead of taking the pre-built aspect of the pong games. 
I felt like that way, I could really appropriate the game as my own creation. Obviously, like any game, I used aspect that already existed such as 
a wave system, a stamina and health bar and much more, but still I think these aspects don’t remove originality from a game, but instead they familiarize
the user with it. They create a sense of connection with the player, that way, even if they have never played my game, they will in a way already know
how to play and know what to do. For the esthetic aspect of the game, although some may find it too simple or ugly, I believe on the other hand that 
it works well exactly because of it simplicity. I think having a complex art style in such a small and simple game may ruin the immersivity of the 
thing and lose its charm. For the gameplay itself, even if the concept isn’t that complex, it still gives a challenge and fun experience. It is in 
its way quite challenging and hard to beat, for myself I had a hard time beating it to test it during the coding. I think Hungry like a wolf reaches
a good state between hard and simple, so even if it’s hard to beat, you still want to try again and play more and its simple look keeps in this state 
of mind because it doesn’t make the thing too complex. I have to admit that I would’ve like to work more on it by giving everything better animations
and maybe to had more wave of diversity in the challenges. Still, I believe that starting from nothing and getting to that point where there’s a few 
complex codes in only a few weeks of training is pretty good and I am satisfied with the work I’ve done.   */


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
Sheep[] sheep = new Sheep[11];
Sheep[] sheep2 = new Sheep[9];
Sheep[] sheep3 = new Sheep[6];
UI hp;
UI stamina;
Farmer farmer;
Farmer farmer2;
Rabbit[] rabbit = new Rabbit[13];
Rabbit[] rabbit2 = new Rabbit[11];
Rabbit[] rabbit3 = new Rabbit[8];
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
  //Sheeps
  for (int i = 0; i < sheep.length; i++) {
    sheep[i] = new Sheep(floor(random(270, 680)), floor(random(40, 260)));
  }for (int i = 0; i < sheep2.length; i++) {
    sheep2[i] = new Sheep(floor(random(270, 680)), floor(random(40, 260)));
  } for (int i = 0; i < sheep3.length; i++) {
    sheep3[i] = new Sheep(floor(random(270, 680)), floor(random(40, 260)));
  }
  //Bunnies
  for (int i = 0; i < rabbit.length; i++) {
    rabbit[i] = new Rabbit(floor(random(0, width)), floor(random(0, height)));
  }for (int i = 0; i < rabbit2.length; i++) {
    rabbit2[i] = new Rabbit(floor(random(0, width)), floor(random(0, height)));
  } for (int i = 0; i < rabbit3.length; i++) {
    rabbit3[i] = new Rabbit(floor(random(0, width)), floor(random(0, height)));
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
      wolf.sneak=false;
      wolf.sprint=false;
      mRabbit.rabbitAlive = true;
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
      wolf.sneak=false;
      wolf.sprint=false;
      farmer2.x=width/2;farmer2.y= height/2;
      mRabbit.rabbitAlive = true;
      state=State.GAME3;
    }
    break;
    
    
    //Appears when you die/lose the game
  case DEAD:
    menu.dead();
    break;
    
    
    //Appears when you win the game
  case WON:
    menu.win();
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
  for (int i = 0; i<10; i++) {
    sheep[i].display();
    sheep[i].update();
    // Manage if sheep dies(remove display+gain health)
    if (dist(wolf.x, wolf.y, sheep[i].x, sheep[i].y)<25 &&sheep[i].sheepAlive) {
      sheep[i].dies();
    }
  }
}
void sheep2() {
  for (int i = 0; i<9; i++) {
    sheep2[i].display();
    sheep2[i].update();
    // Manage if sheep dies
    if (dist(wolf.x, wolf.y, sheep2[i].x, sheep2[i].y)<25 &&sheep2[i].sheepAlive) {
      sheep2[i].dies();
    }
  }
}
void sheep3() {
  for (int i = 0; i<6; i++) {
    sheep3[i].display();
    sheep3[i].update();
    // Manage if sheep dies
    if (dist(wolf.x, wolf.y, sheep3[i].x, sheep3[i].y)<25 &&sheep3[i].sheepAlive) {
      sheep3[i].dies();
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
  for (int i = 0; i<13; i++) {
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
    rabbit2[i].display();
    rabbit2[i].update();
    rabbit2[i].runAway();
    // Manage if rabbit dies
    if (dist(wolf.x, wolf.y, rabbit2[i].x, rabbit2[i].y)<23&&rabbit2[i].rabbitAlive) {
      rabbit2[i].dies();
    }
  }
}
void rabbit3() {
  for (int i = 0; i<8; i++) {
    rabbit3[i].display();
    rabbit3[i].update();
    rabbit3[i].runAway();
    // Manage if rabbit dies
    if (dist(wolf.x, wolf.y, rabbit3[i].x, rabbit3[i].y)<20&&rabbit3[i].rabbitAlive) {
      rabbit3[i].dies();
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