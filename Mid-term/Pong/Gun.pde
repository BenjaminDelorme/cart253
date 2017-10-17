

class Gun {   // ADDED Gun class

  /////////////// Properties ///////////////

  // Default values for speed and size
  int bulletSpeed;
  int bHeight = 6;
  int bWidth = 14;
  int SPEED = 5;
  // The position and velocity of the gun 
  int x;
  int y;
  int vx= 0;
  int vy = 0;
 
  
  
  color bulletColor;
  char shootKey;



  /////////////// Constructor ///////////////

 

  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  Gun(int _x, int _y,int _bulletSpeed, char _shootKey, color _bulletColor) {
    x = _x;
    y = _y;
    
   bulletSpeed = _bulletSpeed;
   bulletColor = _bulletColor;
   

 
    
   shootKey = _shootKey;
    
 
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the gun to the window
  void update() {
    // Update position with velocity (so gun follows the paddle)
    x = x + vx;
    y = y + vy;
    // Constrain gun's y position to be in the window
    y = constrain(y,0 + 35,height - 35);
   
   
  }



  // display()
  //
  // Display the gun/bullet at its location
  
  void display() {
    // Set display properties
    noStroke();
    rectMode(CENTER);
    fill(bulletColor);
    rect(x, y, bWidth, bHeight);
  }
  
  
  
  //ADDED return method so the bull returns to the paddle when it hits the other side of the screen
  void resetL(){
     x= 14; 
     vx = 0;
  }
    void resetR(){
     x= width-14; 
     vx = 0;
    }
    
    
    
    //ADDED the methods telling when the bullet goes off screen
boolean OffScreenLeft() {   
    return (x < 0);     
  }
  boolean OffScreenRight() {
    return  (x > width);
  }
  
  
  
  
  //ADDED keyPressed to shoot the bullet 
  void keyPressed() {
    
    if (key == shootKey) {
      vx = bulletSpeed;
      vy = 0;
    } else if (key == shootKey){
      vx = -bulletSpeed;
      vy = 0;
    }
  }

//ADDED follow the paddles
}