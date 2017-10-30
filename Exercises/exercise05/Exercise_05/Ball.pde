//Created class Ball
class Ball{
  
//Ball class propreties
float speed = 12;
float x;
float y;
float tx;
float ty;
color ballColor;

Ball(float tempx, float tempy, float temptx, float tempty, color tempColor){
  x = tempx;
  y = tempy;
  tx = temptx;
  ty=tempty;
  
  ballColor = tempColor;
}








  
  //Update method for ball class, so the balls move
  
  void update(){
    //used noiseso they move to a random location, but next to the previous location
  float vx = speed * (noise(tx) * 2 - 1);
  float vy = speed * (noise(ty) * 2 - 1);
  
  
  //update ball mvts
  x += vx;
  y += vy;
 
  tx += 0.01;
  ty += 0.01;
  
  
  
  //if ball goes offscreen, it reappears on the other side of the screen
    if (x<0){
   x = width; 
  } else if (x>width){
    x=0;
  }if (y<0){
   y = height; 
  }else if (y>height){
   y=0; 
  }
} 
    
  
  
  
  //Display method for the balls, so they appearas circles
  void display(){
    ellipse(x,y,20,20);
    
  }
  
  
  

  
  
}