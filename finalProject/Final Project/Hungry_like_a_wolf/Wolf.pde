class Wolf {
  float theta = -PI/2;
  float speed = 0;
  float turnSpeed = 0;
  int size = 75;
  int large = 25;
  PImage wolf;

  float x;
  float y;
  boolean sneak;
  boolean sprint;
  boolean walking;
  Wolf(float tempX, float tempY) {
    wolf = loadImage("data/images/wolf_2.png");
    wolf.resize(size, large);
    x = tempX;
    y = tempY;
    
  }



  void update() {
    theta += turnSpeed;
    x += cos(theta) * speed;
    y += sin(theta) * speed;
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
    
    
    
    
    void collision() {
      //wall 1
      if (x >= wall.x1-size/2 && y <= wall.length1 && x<= wall.x1) {
        speed=0;
        x = wall.x1-size/2;
      } else if (x <= wall.x1+size/2 &&y <= wall.length1 && x>= wall.x1 ) {
        speed=0;
        x = wall.x1+size/2;
      }

      //wall 2
      if (y <= wall.y2+size/2&& x>= wall.x2-wall.length2/2 && x<= wall.x2+wall.length2/2 && y >= wall.y2) {
        speed = 0;
        y = wall.y2+size/2;
      } else if (y <= wall.y2&& x>= wall.x2-wall.length2/2 && x<= wall.x2+wall.length2/2 && y >= wall.y2-size/2) {
        speed = 0;
        y = wall.y2-size/2;
      }

      //wall 3
      if (x >= wall.x3-size/2 && y <= wall.y3+wall.length3/2 && y>=wall.y3-wall.length3/2 && x<= wall.x3) {
        speed=0;
        x = wall.x3-size/2;
      } else if (x <= wall.x3+size/2 &&y <= wall.y3+wall.length3/2 && y>=wall.y3-wall.length3/2 && x>= wall.x3 ) {
        speed=0;
        x = wall.x3+size/2;
      }
      //wall 4
      if (x >= wall.x3-size/2 && y <= 90  && x<= wall.x3) {
        speed=0;
        x = wall.x3-size/2;
      } else if (x <= wall.x3+size/2 &&y <= 90  && x>= wall.x3 ) {
        speed=0;
        x = wall.x3+size/2;
      }
  }



  void display() {

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



  void keyPressed() {


    if (keyCode == 16) { //Shift
      sprint = true;
    } else if (keyCode == 17) { //Ctrl
      sneak = true;
    } else {
    }

    if (keyCode == UP) {
      walking = true;
    } else if (keyCode == LEFT) {
      turnSpeed = -0.07;
    } else if (keyCode == RIGHT) {
      turnSpeed = 0.07;
    }



    if (walking == true && sprint==true) { 
      speed = 6;
    } else if (walking == true && sneak==true) {
      speed = 0.8;
    } else if (walking == true) {
      speed = 2.5;
      sprint=false;
      sneak = false;
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
}