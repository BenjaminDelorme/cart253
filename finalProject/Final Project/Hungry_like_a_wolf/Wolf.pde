
///////////////////////////////////////////////   CLASS WOLF(you)    /////////////////////////////////////////////// 


class Wolf {
  
      ///////PROPRETIES////////
///For the wolf's position n rotation
  float theta = -PI/2;
  float speed = 0;
  float turnSpeed = 0;
  float timer;
  float x;
  float y;
  
  int size = 75;
  int large = 25;
  //Images for the "animation"
  PImage wolf;
  PImage wolf2;
  PImage wolf3;
  PImage ani;
  //Booleans controlling the state of the wolf
  boolean sneak;
  boolean sprint;
  boolean walking;
  
  
  ////For the collision method
    float x1=300;
  float y1=150;
  float length1=335;
  float widths=20;
  float x2= 496;
  float y2 = 335;
  float length2=400;
  float x3=700;
  float y3=250;
  float length3=190;
  
  
  
    ///////METHODS////////
    
  Wolf(float tempX, float tempY) {
    wolf = loadImage("data/images/wolf_1.png");
    wolf2 = loadImage("data/images/wolf_2.png");
    wolf3 = loadImage("data/images/wolf_4.png");
    wolf.resize(75, 25);
    wolf2.resize(75, 25);
    wolf3.resize(75, 25);

    x = tempX;
    y = tempY;
    ani=wolf;
  }


////Updating the wolf/in regards to it's position and rotation
  void update() {
    theta += turnSpeed;
    x += cos(theta) * speed;
    y += sin(theta) * speed;
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
    
    
    
  ////Collison with the fence, so it can only get inside through the door 
    void collision() {
      //wall 1
      if (x >= x1-size/2 && y <= length1 && x<= x1) {
        speed=0;
        x = x1-size/2;
      } else if (x <= x1+size/2 &&y <= length1 && x>= x1 ) {
        speed=0;
        x = x1+size/2;
      }

      //wall 2
      if (y <= y2+size/2&& x>= x2-length2/2 && x<= x2+length2/2 && y >= y2) {
        speed = 0;
        y = y2+size/2;
      } else if (y <= y2&& x>= x2-length2/2 && x<= x2+length2/2 && y >= y2-size/2) {
        speed = 0;
        y = y2-size/2;
      }

      //wall 3
      if (x >= x3-size/2 && y <= y3+length3/2 && y>=y3-length3/2 && x<= x3) {
        speed=0;
        x = x3-size/2;
      } else if (x <= x3+size/2 &&y <= y3+length3/2 && y>=y3-length3/2 && x>= x3 ) {
        speed=0;
        x = x3+size/2;
      }
      //wall 4
      if (x >= x3-size/2 && y <= 90  && x<= x3) {
        speed=0;
        x = x3-size/2;
      } else if (x <= x3+size/2 &&y <= 90  && x>= x3 ) {
        speed=0;
        x = x3+size/2;
      }
  }


//Display the wolf
  void display() {
    pushMatrix();
    float hitBox= x;
    float hitBoxY= y;
    rectMode(CENTER);
    translate(hitBox, hitBoxY);
    rotate(theta);
    image(ani, 0-wolf.width/2, 0-12);
    popMatrix();
  }

///Method relating the wolf hitbox with the other animals (so when collide, it eats the animal)
//This method is here because I had issues with the images of the wolf because the were weirdly align and rotated so 
//I made this to help me change it without affecting the looks of the wolf
  void hitBox() {
    rectMode(CENTER);
    pushMatrix();
    translate(x, y);
    rotate(theta);
    noStroke();
    fill(0, 0, 0, 0);
    rect(0, 0, 15, 15);
    popMatrix();
  }

////////////////////KEYPRESSED////////////////

  void keyPressed() {

    //////Conditionals to react and determine the wolf's state(Sprinting, sneaking, walking or not moving)
    if (keyCode == 16) { //Shift
      sprint = true;
    } if(sprint && keyCode == 17){
      sprint = false;
      sneak = true;
    } if(sneak && keyCode == 16){
      sprint =true;
      sneak = false;
    }
    else if (keyCode == 17) { //Ctrl
      sneak = true;
    } 

//// keyPressed to react when moving or rotating
    if (keyCode == UP) {
     animation();
      walking = true;
    } if (keyCode == LEFT) {
      turnSpeed = -0.07;
    } else if (keyCode == RIGHT) {
     turnSpeed = 0.07;
    }


/////Conditional reacting depending on the wolf state and applying the "animation"
    if (walking == true && sprint==true) { 
      speed = 6;
       if(frameCount % 10 >= 5){
       ani=wolf2; 
      }else{
        ani=wolf3;
      }
    } else if (walking == true && sneak==true) {
      speed = 0.8;
       if(frameCount % 50 >= 26){
       ani=wolf2; 
      }else{
        ani=wolf3;
      }
    } else if (walking == true) {
      speed = 2.5;
      sprint=false;
      sneak = false;
       animation();
    } else if(walking ==false){
      ani=wolf;
    }
  }
  
////////////////////KEYRELEASED////////////////

///key released for when the wolf stops moving
  void keyReleased() {
    if (keyCode == UP) {
      speed = 0;
      walking =false;
      ani=wolf;
    } else if (keyCode == LEFT) {
      turnSpeed = 0;
    } else if (keyCode == RIGHT) {
      turnSpeed = 0;
    }
    
  ///key released for when the wolf stops rotating
    if (keyCode == LEFT && walking == true) {
      turnSpeed = 0;
    animation();
    } if (keyCode == RIGHT && walking == true) {
      turnSpeed = 0;
      animation();
    }
    
   ///key released for changing the wolf's state when certain keys are released (so it doesn't mix up the 4 states regarding the booleans)
    if (keyCode == 16 && walking == true) {
      sprint = false;
      speed = 2.5;
    } else if (keyCode == 16 && walking == false) {
      sprint = false;
      speed = 0;
    }

    if (keyCode == 17 && walking ==true ) {
      sneak = false;
      speed = 2.5;
    } else if (keyCode == 17 && walking ==false) {
      sneak = false;
      speed = 0;
    }
  }
  
  
  
  ////The "animation" method to regulate the type of animation when the wolf is moving
  //(it only works if you move up without rotating, as soon as you rotate,it stops animating unless you stop moving and then start again =( )
  void animation(){
  if(frameCount % 40 <= 20){
       ani=wolf2; 
      }else{
        ani=wolf3;
      }
}
}