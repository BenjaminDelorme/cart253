//Creating "Bouncer" class and setting up variables to define later
class Bouncer {

  int x;
  int y;
  int vx;
  int vy;
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;
  


  //Setting temporary variables, which will be defined in the main program
  //so that we can apply differents settings to different "Bouncer" class
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }


  //Creating the update method, which we'll use in the main program
  //-Making the ball bounce off the walls and making our mouse interact with it
  void update() {
    x += vx;
    y += vy;

    //Adding functions applying in the update() method/ wil be define later
    handleBounce();
    handleMouse();
    handleClick();  //CHANGED added method
  }


  //Defining the handleBounce function - Adding the conditionals so
  //that the ball bounces off the walls
  void handleBounce() {
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
      x= 150;     //CHANGED if one of the balls touch the left or right wall,
      //that ball teleports to a x location of 150

      size = size*2; //CHANGED if ball hits touches left or right wall,
      //that ball"s size doubles
    }

    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
      size = size/2;  //CHANGED if ball hits touches floor or ceilling,
      //that ball"s size gets devided by 2



      size = constrain(size, size/4, size*4); //CHANGED ball size can't get bigger than
      //4 times it's size and get smaller than 4 times it's size
      x = constrain(x, size/2, width-size/2);
      y = constrain(y, size/2, height-size/2);
    }
  }

  //Defining the handleMouse function - Adding the conditionals so
  //that the ball changes color when our mouse in on it
  void handleMouse() {
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }
  
  //CHANGED added mouse click = background flashes
  //when you release the click, the bachground changes color
  void handleClick() {
    if (mousePressed == true) {
      background(color(random(0, 255), random(0, 255), random(0, 255), random(0, 255)));
      
    }
  }


  //Creating the draw method, which we'll use in the main program
  //- Defining the ellipse uses in the program
  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}