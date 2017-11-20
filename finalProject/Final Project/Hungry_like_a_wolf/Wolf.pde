class Wolf {
  float theta = -PI/2;
  float speed = 0;
  float turnSpeed = 0;

PImage wolfOG;

  float x;
  float y;
  boolean sneak;
   boolean sprint;
  boolean walking;
  Wolf(float tempX, float tempY) {
    wolfOG = loadImage("data/images/wolf_2.png");
    wolfOG.resize(75, 25);
    println(wolfOG.height);
    println(wolfOG.width);
    x = tempX;
    y = tempY;  }



  void update() {
    theta += turnSpeed;
    x += cos(theta) * speed;
    y += sin(theta) * speed;
    x = constrain(x,0,width);
    y = constrain(y,0+wolfOG.height,height);
   // println(y);
  }


  
  void display(){
    rectMode(CENTER);
     pushMatrix();
    translate(x, y);
   // println("translate x:" + x);
     //   println("translate y:" + y);

    rotate(theta);
    image(wolfOG, 0, 0);
    wolfOG.resize(75, 25);
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
      turnSpeed = -0.05;
    } else if (keyCode == RIGHT) {
      turnSpeed = 0.05;
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