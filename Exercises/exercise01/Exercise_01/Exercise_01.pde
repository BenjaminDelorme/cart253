// Setting numbers to certain variables to use as shortcuts or
//  for clearer understanding of the code.
final int CIRCLE_SPEED = 7;
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
final int CIRCLE_SIZE = 50;

// Assigning certains names for the variables, which we will
//  define their value later on.
int circleX;  // X position of the circle 
int circleY;  // Y position of the circle
int circleVX; // speed of X variable
int circleVY; // speed of Y variable

// Setup for first frame
void setup() {
  size(640, 480);  // size of the screen
  circleX = width/2;  // X position starts in the middle
  circleY = height/2; // Y position starts in the middle
  circleVX = CIRCLE_SPEED; // speed of X will be 7
  circleVY = CIRCLE_SPEED; // speed of Y will be 7
  stroke(STROKE_COLOR);  
  fill(NO_CLICK_FILL_COLOR);
  background(BACKGROUND_COLOR);
}

// Setup the actual "game"
void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR); 
    //if the distance between the mouse position and the centerof the circle is
    //smaller than half of the circle size, the circle becomes blue.
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
    // or else, the color remainsthe same/ it's original color, in setup.
  }
  
  // Making the ellipse move
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); // size and position of the ellipse
  circleX += circleVX; // X position of the circle will move +7 every frame
  circleY += circleVY; // Y position of the circle will move +7 every frame
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX; // if the edge of the circle touches the right side (weight)
    // or the left side (0) of the screen, the circle speed (circleVX)
    //turns negative(-7),which will make it turn around.
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;// if the edge of the circle touches the top (0)
    // or the bottom (height) of the screen, the circle speed (circleVY) turns 
    //negative(-7), which will make it turn around.
  }
  
}

void mousePressed() {
  background(BACKGROUND_COLOR); // evertime the mouse is clicked, the background
  //comes on top, so the game "resets".
}