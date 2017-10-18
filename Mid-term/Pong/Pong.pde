// Pong

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

//ADDED gun classes
Gun rightGun;
Gun leftGun;


Text text;


boolean gameStart = false;

//ADDED bullet moving boolean, to change their propreties if they are moving
boolean LbulletMoving= false;
boolean RbulletMoving = false;


//ADDED these boolean, to use when one of the paddle is hit
boolean RpaddleHit = false;
boolean LpaddleHit = false;

//ADDED a boolean to track if  the ball is moving or not
boolean ballMoving;


// The distance from the edge of the window a paddle should be
int RPx = 8;
int RPy = 540/2;
int LPx = width-8;
int LPy = 540/2;

int frame;

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


//ADDED timer variables

  int timerR = 0;
  int timerL = 0;
  int timerLength = 1500;


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
  leftPaddle = new Paddle(RPx, RPy, 87, 83, color (113,3,3));
  rightPaddle = new Paddle(width - RPx, LPy, 38 , 40,color (30,69,0));

  ball = new Ball(width/2, height/2, ' ');      //ADDED "space" key as the key to start moving the ball
  
  //ADDED gun class/ defines their arguments
  leftGun = new Gun(LGx, LGy,10, 'd',color (113,3,3));
  rightGun = new Gun(RGx, RGy,-10,37,color (30,69,0));
  
  text = new Text();
}



void draw() {
  // ADDED the background image in the draw, resized-it so it would fit the screen
  image(background,-25,-15); 
  
  background.resize(width +50,height +30);



  
  


// Paddle and ball upgrade method apply
  leftPaddle.update();
  rightPaddle.update();
  
  ball.update();
  
  
  //ADDED gun upgrade methods apply
  
  leftGun.update();
  rightGun.update();
 
 
 
  // Check if the ball has collided with either paddle
  //CHANGED ball.collide only apply is paddle.Hit is false(is the paddle isn't hit by a bullet)/
  //seperated the two
  
  //CHANGED added the boolean function, that way when the paddle "revive", their propreties return
  if(RpaddleHit == false){
  ball.collide(rightPaddle);
  rightPaddle.paddleColor = color (30,69,0);
  }
  
  if(LpaddleHit == false){
    ball.collide(leftPaddle);
    leftPaddle.paddleColor = color (113,3,3);
  }

//ADDED a function to track if the ball is moving or not
if(ball.vx != 0){
  ballMoving = true;
} else {
 ballMoving = false; 
}




 

handleBullets();

 
 
 //////////OFF SCREEN //////////
 
 
 
 
 
 

  // Check if the ball has gone off the screen
  // If it has, reset the ball 
  //CHANGED/ADDED if the ball goes off on one side of the screen, add 1 to the number displayed on the other side of the screen
  
  
  if (ball.OffScreenRight()) {                                      
    ball.reset();
    scoreLeft ++;
    ball.SPEED = -8; //ADDED if right player loses round, next round starts with ball against ennemy
  }
  if (ball.OffScreenLeft()) {
    ball.reset();
    scoreRight++;
    ball.SPEED = 8; //ADDED if left player loses round, next round starts with ball against ennemy
   
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




 //////////START //////////

//ADDED if the game hasn't  started, text from Intro class will be displayed
if (gameStart == false){
 text.introText();
}


//CHANGED put these function so that they apply only if game is started
if(gameStart==true){
   ball.display();
   
    //ADDED score display
    textSize(30);
fill(113,3,3);
  text(scoreLeft, 30, 50); 
  fill(30,69,0);
  text(scoreRight, width-30, 50);
}



 //////////DISPLAYS //////////
 
 
 
  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
 
  //ADDED gun display methods
  leftGun.display();
  rightGun.display();
  
  
  
  
   //////////SCORE //////////
  
  //ADDED when one player reach score of 10, screen goes black and display these texts/Strings
  if (scoreLeft == 5 ) {
   text.playerLeftWin();
  } else if (scoreRight == 5) {
 text.playerRightWin();
 
  }
}


void handleBullets(){
 


//ADDED these happen if left bullet hits right paddle
 if(leftGun.x >= width - 14 && leftGun.y >= rightPaddle.y-35 && leftGun.y <= rightPaddle.y+35){
   rightPaddle.RpaddleHit();  
   RpaddleHit = true;
   timerR = millis();

   
 }
 
 
 
 //ADDED these happen if right bullet hits left paddle
 if(rightGun.x <= 14 && rightGun.y >= leftPaddle.y-35 && rightGun.y <= leftPaddle.y+35){
  leftPaddle.LpaddleHit();
  LpaddleHit = true;
  timerL = millis();
 }
 
 
 
 
 if(RpaddleHit == true && millis() - timerR >= timerLength){
  RpaddleHit = false; 
 }
 
 if(LpaddleHit == true && millis() - timerL >= timerLength){
  LpaddleHit = false; 
 }
  
}




 //////////KEYPRESSED //////////
 
 // keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

 
void keyPressed() {

  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
  
  //CHANGED/ADDED use ballMoving boolean, that way, can't use the space method on ball if it's already moving
  if(ballMoving == false){
  ball.keyPressed();     // ADDED press "space" to make the ball move when start a new round
  }
  
  
  //ADDED  if shoot key is not pressed, bullet follows thr paddle. If pressed,
  // the bullet vy stays 0 but its x moves to the other side of the screen
  if(LbulletMoving == false){   
    leftGun.vy = leftPaddle.vy; 
    if(key == 'd'){
      LbulletMoving= true;
      leftGun.vy = 0;
      leftGun.vx = 10;
    }
  }
   if(RbulletMoving == false){
    rightGun.vy = rightPaddle.vy;
    if(keyCode == 37){
      RbulletMoving= true;
      rightGun.vy = 0;
      rightGun.vx = -10;
    }
}


//ADDED if click space, game starts
if(gameStart == false){
  if(key == ' '){
   gameStart=true; 
  }
}
}



//////////KEYRELEASED //////////
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