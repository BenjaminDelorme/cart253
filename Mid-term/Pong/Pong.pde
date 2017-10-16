// Pong

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
//ADDED gun classes
Gun rightGun;
Gun leftGun;


// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;
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
  size(640, 420);  
  textSize(50);    
  textAlign(CENTER);
  background = loadImage("Images/blueBG.jpg"); // ADDED Initialized the background image as my background
  
  



  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'w', 's', 55);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o' , 'l',200);

  ball = new Ball(width/2, height/2, ' ');      //ADDED "space" key as the key to start moving the ball
  
  //ADDED gun class/ defines their arguments
  leftGun = new Gun(0, height/2,10, 'g','w', 's',55);
  rightGun = new Gun(width, height/2,-10,'m', 'o','l',200);
}



void draw() {
  // ADDED the background image in the draw, resized-it so it would fit the screen
  image(background,0,0); 
  background.resize(640,420);


 //ADDED score display
fill(55);
  text(scoreLeft, 30, 50); fill(200);
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
  
  //ADDED when the bullets go off screen reset methods
   if(leftGun.OffScreenRight()){
   leftGun.resetL(); 
   }
   if(rightGun.OffScreenLeft()){
     rightGun.resetR();
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
    background.resize(640,420);
    fill(185,34,190);
    text(Over, width/2, height/2);
    textSize(30);
    fill(55);
    text(leftWin, width/2, height/2 + 40);
    text(scoreLeft, width/2 - 50, height/2 +100);
    fill(200);
    text(scoreRight, width/2 + 50, height/2 +100);
  } else if (scoreRight == 5) {
    textSize(60);
    image(background,0,0);
    background.resize(640,420);
    fill(185,34,190);
    text(Over, width/2, height/2);
    textSize(30);
    fill(200);
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
  leftGun.keyPressed();
  rightGun.keyPressed();
}





// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
    //ADDED gun keyReleased methods
  leftGun.keyReleased();
  rightGun.keyReleased();
}