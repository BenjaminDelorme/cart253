
color backgroundColor = color(233);
//Variables for flickery background      CHANGED size and color
int numStatic = 40;
int staticSizeMin = 1;
int staticSizeMax = 220;
color staticColor = color(250);

//Variables for paddle(size, mouvements,color...)
int paddleX;
int paddleY;
int paddleVX;
int paddleVY;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(0,255,0);

//Variables for the ball(Size,mouvements, color...)
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 0;
int ballSize = 20;
color ballColor = color(255,0,0); 

int rectX = 20;
int rectY = 30;

//Setup program
void setup() {
  size(640, 480);

  //Using costum function in setup
  setupPaddle();
  setupBall();

}

//Creating function for original paddle
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

//Creating function for original ball
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

//Creating function for animation and interaction
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();
  handleBallHitPaddle();

  drawPaddle();
  drawBall();
}

//Makes the flickery background, with random small square of different size from 1 to 3 appearing
//randomly throughout the screen. Different every frame.
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    stroke(0);
    rect(x, y, staticSize, staticSize);
  }
}

//Setting paddle to is original speed/making it unable to go offscreen;
//when the paddle hits the right or left border, all other value beyond those points are forgotten/unaccessible
void updatePaddle() {
  paddleX += paddleVX;  
  paddleY += paddleVY; // CHANGED Added ability tomove paddle up and down
  paddleY = constrain(paddleY, 0+paddleHeight/2, height - paddleHeight/2);
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2); //CHANGED unable paddle to go lower than screen
}

//Ball propreties during the game
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;


//Setting own functions


handleBallHitWall();
handleBallOffBottom();
}

//Draw the paddle
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}
//Draw the ball
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

//Whenn ball hit the top of the paddle, its Y speed switches so the ball "bounces"
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;      
    paddleColor += 20; //CHANGED the more the ball hits the paddle,the more the paddle and the ball get blue
    
  }

}

//Setting this fonction so if the ball is within the range of the top of the paddle, it is true, othewise its false
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

//If balls drop below screen, it respawns in the middle
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
    ballVX =0;
    ballVY = 0;
    paddleColor = 0; // CHANGED the ball and paddle return to black if ball falls off
    ballColor = 0;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

//If the ball hits a wall ou the ceiling, it bounces off (reverse speed) 
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
    ballColor += 20;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

//Making us able to move the paddle with the arrows
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  } else if (keyCode== UP) {//  CHANGED able to move paddle up and down
    paddleVY = -paddleSpeed;
  } else if (keyCode == DOWN){
    paddleVY = paddleSpeed;
  }
  if (keyCode == 32) {
    ballVX =(7);      //CHANGED press SPACE so that the ball starts moving
    ballVY = 7;
  }
}
//If we release the keys, the paddle stops moving
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  } else if (keyCode == UP && paddleVY < 0) { //  CHANGED paddle stop moving up and down when key released
    paddleVY = 0;
  }else if (keyCode == DOWN && paddleVY > 0) {
    paddleVY = 0;}
}