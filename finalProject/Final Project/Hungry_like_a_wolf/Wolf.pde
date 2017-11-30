class Wolf {
  float theta = -PI/2;
  float speed = 0;
  float turnSpeed = 0;

PImage wolf;

  float x;
  float y;
  boolean sneak;
   boolean sprint;
  boolean walking;
  Wolf(float tempX, float tempY) {
    wolf = loadImage("data/images/wolf_2.png");
    wolf.resize(75, 25);
    x = tempX;
    y = tempY;  }



  void update() {
    theta += turnSpeed;
    x += cos(theta) * speed;
    y += sin(theta) * speed;
    x = constrain(x,0,width);
    y = constrain(y,0,height);
    x= constrain(x,0,width);

  }


  
  void display(){
    
     pushMatrix();
     float hitBox= x;
     float hitBoxY= y;
     rectMode(CENTER);
    translate(hitBox, hitBoxY);
    rotate(theta);
    image(wolf, 0-wolf.width/2, 0-12);
    wolf.resize(75, 25);
    popMatrix();
    
  }
 
void hitBox(){
  
  
  rectMode(CENTER);
     pushMatrix();
    translate(x, y);
    rotate(theta);
    noStroke();
      fill(0,0,0,0);
     rect(0,0,15,15);
    popMatrix();
}



  void keyPressed() {
    if(keyCode == 16){ //Shift
      sprint = true;
    } else if (keyCode == 17){ //Ctrl
      sneak = true;
    } else {
  
    }
    
    if (keyCode == UP) {
      walking = true;
    }  else if (keyCode == LEFT) {
      turnSpeed = -0.07;
    } else if (keyCode == RIGHT) {
      turnSpeed = 0.07;
    }
    
 
    
     if (walking == true && sprint) { 
      speed = 6;
    } else if (walking == true && sneak) {
      speed = 1.3;
    } else if (walking == true){
      speed = 3.2;
    }
    


   
  }

  void keyReleased() {
    if (keyCode == UP) {
      speed = 0;
      walking =false;
    } else if (keyCode == LEFT) {
      turnSpeed = 0;
    } else if (keyCode == RIGHT) {
      turnSpeed = 0;
    }
    
    if(keyCode == 16){
      sprint = false;
    } else if (keyCode == 17){
      sneak = false;
    }
  }
}