class Sheep{
  float theta = -PI/2;
  float turnSpeed = 0;
 
PImage sheep;

float tx = random(0,100);
float ty = random(0,100);
float x;
float y;
  Sheep() {
  
     sheep = loadImage("data/images/sheep.png");
}



  void update() {
 x = width*noise(tx);
 y = width*noise(ty);
    theta += turnSpeed;
    //x += cos(theta) * speed;
    //y += sin(theta) * speed;
  tx += 0.002;
  ty += 0.003;
    
    x = constrain(x,0+sheep.width,width-sheep.width);
    y = constrain(y,0+sheep.height,height-sheep.height);
  }


  
  void display(){
    image(sheep, x, y);
    sheep.resize(35, 55);
    
    //rectMode(CENTER);
    // pushMatrix();
    //translate(x, y);
    //rotate(theta);
    //image(sheep, 0, 0);
    //sheep.resize(35, 55);
    //popMatrix();
    
  }
 


  
  
}