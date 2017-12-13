
///////////////////////////////////////////////   CLASS SHEEP    /////////////////////////////////////////////// 


class Sheep{
  
  ///////PROPRETIES////////
PImage sheep;
boolean sheepAlive=true;
float tx = random(0,100);
float ty = random(0,100);
float speed = 2;
float x;
float y;

    ///////METHODS////////

  Sheep(float tempX, float tempY) {
  x = tempX;
  y = tempY;
     sheep = loadImage("data/images/sheep.png");
     sheep.resize(35, 55);
}


////Update the sheeps / make them move at random inside their fence


  void update() {
    float vx = speed * (noise(tx)*2-1);
    float vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;
  tx += 0.01;
  ty += 0.01;
    x = constrain(x,265+sheep.width,690-sheep.width);
    y = constrain(y,90,335-sheep.height);
  }


  ////Display the sheeps in the array at random x and y locations inside the fence
  void display(){
    if (sheepAlive){
      float hitBox = x+17;
      float hitBoxY = y+17;
    image(sheep, x, y);
    fill(0,0);
    rect(hitBox,hitBoxY,20,35);
    }
  }
  
  
  /////Handle what happends when the sheeps in the array die(health gain, sounds and remove display)
void dies(){
  sheepAlive = false;
  chomp.play();
  sheepBeh.play(1,0.8);
  hp.health = hp.health+20;
}


  
  
}