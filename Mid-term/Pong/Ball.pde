// Ball


class Ball {

  /////////////// Properties ///////////////


  int SPEED = 5;
  int SIZE = 16;

  int x;
  int y;

  int vx;
  int vy;

  color ballColor = color(185,34,190);
  char space;   // ADDED "space as a propretie to use later


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y, char _space) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
    space = _space;
   
  }


  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;
  

    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }
  
  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity
  
  void reset() {
    x = width/2;
    y = height/2;
    vx = 0;
    vy = 0;
   SPEED = -SPEED;       // ADDED ball swich side everytime the ball resets
  }
  
  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")
  
  boolean OffScreenLeft() {       //CHANGED split the isOffScreen method to create a OffLeft and OffRight, that way
    return (x + SIZE/2 < 0);      //I can keep track of the score
  }
  boolean OffScreenRight() {
    return  (x - SIZE/2 > width);
  }

  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);
    
    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx- floor(random(1,4));  //CHANGED when collide, ball vy changes to a random number between 1 and 4 more than OG speed (makes bounce more surprising)
    }
  }

  // display()
  //
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);

    // Draw the ball
    rect(x, y, SIZE, SIZE);
  }
  
  // ADDED need to press "space" for the ball to start moving
  void keyPressed(){
   if (key == space){
     vx = SPEED;
     vy = SPEED + floor(random(1,4)); //CHANGED when start (press space), ball vy start to a random number between 1 and 4 more than OG speed (makes bounce more surprising)
  }
  }
}