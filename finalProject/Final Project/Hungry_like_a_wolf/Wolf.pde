class Wolf {
  float theta = -PI/2;
  float speed = 0;
  float turnSpeed = 0;

PImage wolfOG;

  float x;
  float y;
  boolean sneak;
  boolean walking;
  Wolf(float tempX, float tempY) {
    wolfOG = loadImage("data/images/wolf_1.png");
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
    image(wolfOG, 0, 0);
    wolfOG.resize(75, 25);
    popMatrix();
    
  }
 

  void keyPressed() {
    if (keyCode == UP) {
      speed = 3.2;
      walking = true;
    } else if (keyCode == LEFT) {
      turnSpeed = -0.05;
    } else if (keyCode == RIGHT) {
      turnSpeed = 0.05;
    }

    if (keyCode == 16 && walking == true) {
      speed = 6;
    } else if ((keyCode == 17&& walking == true)) {
      speed = 1.3;
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
      speed = 3.2;
    } else if ((keyCode == 17&& walking == true)) {
      speed = 3.2;
    }
  }
}