class Rabbit{

 

boolean rabbitAlive=true;

float tx = random(0,100);
float ty = random(0,100);
float speed = 2;
float x;
float y;

  Rabbit(float tempX, float tempY) {
  x = tempX;
  y = tempY;

}



  void update() {
    float vx = speed * (noise(tx)*2-1);
    float vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;

  tx += 0.01;
  ty += 0.01;
    x = constrain(x,0,width);
    y = constrain(y,0,height);
    
    //if(x<265+sheep.width || x>690-sheep.width){
    // vx = -vx; 
    //}
    //if(y< 40 ||y >335- sheep.height){
    //  vy = -vy;
    //}
    //x = constrain(x,0+sheep.width,width-sheep.width);
   // y = constrain(y,0+sheep.height,height-sheep.height);
  }


  
  void display(){
    if (rabbitAlive){
      float hitBox = x+17;
      float hitBoxY = y+17;
       fill(255);
    ellipse(hitBox,hitBoxY,20,20);
    //rect(500,10,400,650);
    }
  
  }
  
  
  
void dies(){
  rabbitAlive = false;
}

  
  
}