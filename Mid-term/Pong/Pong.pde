// Pong

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Score leftScore;
Score rightScore;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;
color backgroundColor = color(0);
int scoreLeft = 0;
int scoreRight = 0;


void setup() {

  size(640, 480);
  //f = createFont("Arial",16,true);Pfont f;
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');


  ball = new Ball(width/2, height/2, ' ');
  
  leftScore = new Score(scoreLeft,20,20);
  rightScore = new Score(scoreRight,70,20);
}


void draw() {
  background(backgroundColor);


  leftPaddle.update();
  rightPaddle.update();
  ball.update();


  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.OffScreenLeft() || ball.OffScreenRight()) {
    // If it has, reset the ball
    ball.reset();
    }
    if (ball.OffScreenLeft()){
    scoreLeft ++;
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  leftScore.display();
  rightScore.display();
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
  ball.keyPressed(); // ADDED press "space" to make the ball move when start a new round
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}