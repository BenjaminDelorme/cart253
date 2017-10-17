// Pong

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

//ADDED gun classes
Gun rightGun;
Gun leftGun;


//ADDED bullet moving boolean, to change their propreties if they are moving
boolean LbulletMoving= false;
boolean RbulletMoving = false;


// The distance from the edge of the window a paddle should be
int RPx = 8;
int RPy = 540/2;
int LPx = width-8;
int LPy = 540/2;


int RGx= 720-14;
int RGy= 270;
int LGx= 0+14;
int LGy= 270;

color backgroundColor = color(0);
int scoreLeft = 0; //ADDED left score variable
int scoreRight = 0; //ADDED right score variable

//ADDED string to display text at the end of the game
  String Over= "GAME OVER";
String leftWin= "Left Player Won";
String rightWin= "Right Player Won";

PImage background; //ADDED PImage to declare an image with background name


void setup() {

  //ADDED settings for the text/score display
  size(720, 540);  
  textSize(50);    
  textAlign(CENTER);
  background = loadImage("Images/BG.png"); // ADDED Initialized the background image as my background
  
  



  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(RPx, RPy, 87, 83, 55);
  rightPaddle = new Paddle(width - RPx, LPy, 38 , 40,255);

  ball = new Ball(width/2, height/2, ' ');      //ADDED "space" key as the key to start moving the ball
  
  //ADDED gun class/ defines their arguments
  leftGun = new Gun(LGx, LGy,10, 'g',55);
  rightGun = new Gun(RGx, RGy,-10,'m',255);
}



void draw() {
  // ADDED the background image in the draw, resized-it so it would fit the screen
  image(background,0,0); 
  background.resize(width,height);



  
  
 //ADDED score display
fill(55);
  text(scoreLeft, 30, 50); fill(255);
  text(scoreRight, width-30, 50);



  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  
  
  //ADDED gun upgrade methods
  leftGun.update();
  rightGun.update();
 
 
  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);


 if(leftGun.x == width && leftGun.y >= rightPaddle.y+35 && leftGun.y <= rightPaddle.y-35){
   background(0);
 }

  // Check if the ball has gone off the screen
  if (ball.OffScreenRight()) {                      //CHANGED/ADDED if the ball goes off on one side of the screen, 
    // If it has, reset the ball                       add 1 to the number displayed on the other side of the screen
    ball.reset();
    scoreLeft ++;
  }
  if (ball.OffScreenLeft()) {
    ball.reset();
    scoreRight++;
  }  
  
  //ADDED when the bullets go off screen, reset methods and moving propreties resets
   if(leftGun.OffScreenRight()){
   leftGun.resetL(); 
   leftGun.vy = leftPaddle.vy;
   leftGun.y = leftPaddle.y;
   LbulletMoving = false;
   }
   if(rightGun.OffScreenLeft()){
     rightGun.resetR();
     rightGun.vy = rightPaddle.vy;
     rightGun.y = rightPaddle.y;
     RbulletMoving = false;
   }




  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  //ADDED gun display methods
  leftGun.display();
  rightGun.display();
  
  
  
  //ADDED when one player reach score of 10, screen goes black and display these texts/Strings
  if (scoreLeft == 5) {
    textSize(60);      
    image(background,0,0);
    background.resize(width,height);
    fill(185,34,190);
    text(Over, width/2, height/2);
    textSize(30);
    fill(55);
    text(leftWin, width/2, height/2 + 40);
    text(scoreLeft, width/2 - 50, height/2 +100);
    fill(255);
    text(scoreRight, width/2 + 50, height/2 +100);
  } else if (scoreRight == 5) {
    textSize(60);
    image(background,0,0);
    background.resize(width,height);
    fill(185,34,190);
    text(Over, width/2, height/2);
    textSize(30);
    fill(255);
    text(rightWin, width/2, height/2 + 40);
    text(scoreRight, width/2 + 50, height/2 +100);
    fill(55);
    text(scoreLeft, width/2 - 50, height/2 +100);
 
  }
}



// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {

  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
  ball.keyPressed();     // ADDED press "space" to make the ball move when start a new round
  //ADDED gun keyPressed methods
  
  
  //ADDED  if shoot key is not pressed, bullet follows thr paddle. If pressed,
  // the bullet vy stays 0 but its x moves to the other side of the screen
  if(LbulletMoving == false){   
    leftGun.vy = leftPaddle.vy; 
    if(key == 'g'){
      LbulletMoving= true;
      leftGun.vy = 0;
      leftGun.vx = 10;
    }
  }
   if(RbulletMoving == false){
    rightGun.vy = rightPaddle.vy;
    if(key == 'm'){
      RbulletMoving= true;
      rightGun.vy = 0;
      rightGun.vx = -10;
    }
}

}



// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
  
  //ADDED if bullet isn<t shot, it follows the paddle
  if(LbulletMoving == false){
    leftGun.vy = leftPaddle.vy;
  }
   if(RbulletMoving == false){
    rightGun.vy = rightPaddle.vy;
   }
}