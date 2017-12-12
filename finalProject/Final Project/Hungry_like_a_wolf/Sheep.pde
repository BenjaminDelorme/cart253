class Sheep{
PImage sheep;
boolean sheepAlive=true;
float tx = random(0,100);
float ty = random(0,100);
float speed = 2;
float x;
float y;

  Sheep(float tempX, float tempY) {
  x = tempX;
  y = tempY;
     sheep = loadImage("data/images/sheep.png");
     sheep.resize(35, 55);
}



  void update() {
    float vx = speed * (noise(tx)*2-1);
    float vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;
  tx += 0.01;
  ty += 0.01;
    x = constrain(x,265+sheep.width,690-sheep.width);
    y = constrain(y,70,335-sheep.height);
  }


  
  void display(){
    if (sheepAlive){
      float hitBox = x+17;
      float hitBoxY = y+17;
    image(sheep, x, y);
    rect(hitBox,hitBoxY,20,35);
    }
  }
  
  
  
void dies(){
  sheepAlive = false;
  sheepBeh.play(1,0.2);
}

void reset(){
  
}
  
  
}