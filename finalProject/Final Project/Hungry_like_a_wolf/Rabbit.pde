class Rabbit{

 

boolean rabbitAlive=true;

float tx;
float ty;
float speed = 1;
float x;
float y;
float vx;
float vy;

  Rabbit(float tempX, float tempY) {
  x = tempX;
  y = tempY;

}



  void update() {
  vx = speed * (noise(tx)*2-1);
  vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;

  tx += 0.01;
  ty += 0.01;
    x = constrain(x,0,width);
    y = constrain(y,0,height);
    
    //x = constrain(x,0+sheep.width,width-sheep.width);
   // y = constrain(y,0+sheep.height,height-sheep.height);
  }


  
  void display(){
    if (rabbitAlive){
      float hitBox = x+17;
      float hitBoxY = y+17;
       fill(255);
    ellipse(hitBox,hitBoxY,20,20);
    //rect(500,10,400,650);
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