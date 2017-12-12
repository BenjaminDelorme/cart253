
///////////////////////////////////////////////   CLASS RABBIT    /////////////////////////////////////////////// 


class Rabbit{

  ///////PROPRETIES////////
PImage rabbit;
PImage mrabbit;
boolean rabbitAlive=true;

float tx=random(0,100);
float ty=random(0,100);
float speed = 1;
float x;
float y;
float vx;
float vy;


    ///////METHODS////////

  Rabbit(float tempX, float tempY) {
  x = tempX;
  y = tempY;
  rabbit = loadImage("images/rabbit.png");
  mrabbit = loadImage("images/mrabbit.png");
  rabbit.resize(30,30);
  mrabbit.resize(26,26);
}


////Update the rabbits / make them move at random around the map
  void update() {
  vx = speed * (noise(tx)*2-1);
  vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;

  tx += 0.01;
  ty += 0.01;
    x = constrain(x,400,width);
    y = constrain(y,0,height);
   
  }


////Display the rabbits in the array at random x and y locations
  void display(){
    if (rabbitAlive){
     rectMode(CENTER);
      image(rabbit,x,y);
    } 
  }
  
  
  ////Display the magical rabbit at a random x and y location
  void mDisplay(){
    if (rabbitAlive){
         rectMode(CENTER);
      image(mrabbit,x,y);
    }
  }
 
 ////Methods that affects how the rabbits react near the wolf
 //If he's sneaking, they might not notice
 //Else, they'll run away if he's near
  void runAway(){
   if (dist(wolf.x, wolf.y, x,y)<80 && wolf.sneak == false) {
      vx= - vx;
      vy = -vy;
      speed = 10;
    } else if 
    (dist(wolf.x, wolf.y, x,y)<30) {
      vx= - vx;
      vy = -vy;
      speed = 12;
  }else{
      speed = 1;
    }
    
    
  }
  
  
  /////Handle what happends when the rabbits in the array die(health gain, sounds and remove display)
void dies(){
  rabbitAlive = false;
  bunny.play(1,0.2);
  chomp.play();
  hp.health = hp.health+10;
}

  /////Handle what happends when the magical rabbit dies(health gain, sounds and remove display)
void diesM(){
  rabbitAlive = false;
  chomp.play();
  bunny.play(1,0.2);
  hp.health = hp.health+100;
}

  
  
}