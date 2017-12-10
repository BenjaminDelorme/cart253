class Sheep{
  float theta = -PI/2;
  float turnSpeed = 0;
 
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
}



  void update() {
    float vx = speed * (noise(tx)*2-1);
    float vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;

    //theta += turnSpeed;
    //x += cos(theta) * speed;
    //y += sin(theta) * speed;
  tx += 0.01;
  ty += 0.01;
    x = constrain(x,265+sheep.width,690-sheep.width);
    y = constrain(y,70,335-sheep.height);
    
    //if(x<265+sheep.width || x>690-sheep.width){
    // vx = -vx; 
    //}
    //if(y< 40 ||y >335- sheep.height){
    //  vy = -vy;
    //}
    //x = constrain(x,0+sheep.width,width-sheep.width);
   // y = constrain(y,0+sheep.height,height-sheep.height);
  }


  
  void display(){
    if (sheepAlive){
      float hitBox = x+17;
      float hitBoxY = y+17;
    image(sheep, x, y);
    rect(hitBox,hitBoxY,20,35);
    sheep.resize(35, 55);
    //fill(255);
    //rect(500,10,400,650);
    }
    //rectMode(CENTER);
    // pushMatrix();
    //translate(x, y);
    //rotate(theta);
    //image(sheep, 0, 0);
    //sheep.resize(35, 55);
    //popMatrix();
    
  }
  
  
  
void dies(){
  sheepAlive = false;
}

void reset(){
  
}
  
  
}