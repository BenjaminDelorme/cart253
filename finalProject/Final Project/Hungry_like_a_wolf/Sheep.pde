class Sheep{
  float theta = -PI/2;
  float speed = 0;
  float turnSpeed = 0;

PImage sheep;

  float x;
  float y;
  boolean sneak;
  boolean walking;
  Sheep(float tempX, float tempY) {
    sheep = loadImage("data/images/sheep.png");
    x = tempX;
    y = tempY;  }



  void update() {
    theta += turnSpeed;
    x += cos(theta) * speed;
    y += sin(theta) * speed;
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }


  
  void display(){
    rectMode(CENTER);
     pushMatrix();
    translate(x, y);
    rotate(theta);
    image(sheep, 0, 0);
    sheep.resize(75, 25);
    popMatrix();
    
  }
 


  
  
}