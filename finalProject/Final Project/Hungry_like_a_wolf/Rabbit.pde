class Rabbit{

 
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

  Rabbit(float tempX, float tempY) {
  x = tempX;
  y = tempY;
  rabbit = loadImage("images/rabbit.png");
  mrabbit = loadImage("images/mrabbit.png");
}



  void update() {
  vx = speed * (noise(tx)*2-1);
  vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;

  tx += 0.01;
  ty += 0.01;
    x = constrain(x,400,width);
    y = constrain(y,0,height);
   
   
   if (y<= 365 && x>=265&& x<=695){
   speed = -speed;
   }
  }


  
  void display(){
    if (rabbitAlive){
     rectMode(CENTER);
      image(rabbit,x,y);
     rabbit.resize(30,30);
    }
  }
  
  void mDisplay(){
    if (rabbitAlive){
         rectMode(CENTER);
      image(mrabbit,x,y);
     mrabbit.resize(26,26);
    }
  }
 
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
  
  
void dies(){
  rabbitAlive = false;
}

  
  
}