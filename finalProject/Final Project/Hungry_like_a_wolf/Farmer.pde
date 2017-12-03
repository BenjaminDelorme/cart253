class Farmer{
  PImage farmer;
  float scale = 1;
  float x;
  float y;
  float vx;
  float vy;
  //float tx = random(20,60);
  //float ty = random(0,100);
  float speed =2;
  Farmer(float tempX, float tempY){
    x=tempX;
    y=tempY;
    farmer = loadImage("images/farmer.png");
  }
  
  void update(){
   vx = speed;// * (noise(tx)*2-1);
   //vy = speed * (noise(ty)*2-1);
  x += vx;
  //y += vy;
  }
  
  void sight(){
    if(speed>=0&& wolf.y<=y+80&&wolf.y>=y-40 && wolf.x >= x && wolf.x<=x+400){
     println("yus");
    } else if(speed<=0&& wolf.y<=y+80&&wolf.y>=y-40 && wolf.x <= x && wolf.x>=x-400){
      println("amen");
    }
  }
  
  void route(){
      if(x <= 200 || x>= 900){
    speed = -speed;
    
      }
  }
  
  void display(){
    pushMatrix();
   rectMode(CENTER);
   scale(scale);
   image(farmer,x,y);
   farmer.resize(60,80);
  popMatrix();
  }
}