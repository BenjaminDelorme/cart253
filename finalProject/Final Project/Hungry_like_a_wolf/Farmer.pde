class Farmer{
  PImage farmer;
  PImage farmer2;
  float scale = 1;
  float x;
  float y;
  float vx;
  float vy;
  boolean LtR=true;
  //float tx = random(20,60);
  //float ty = random(0,100);
  float speed =2;
  Farmer(float tempX, float tempY){
    x=tempX;
    y=tempY;
    farmer = loadImage("images/farmer.png");
    farmer2 = loadImage("images/farmer2.png");
  }

  void update(){
   vx = speed;// * (noise(tx)*2-1);
   //vy = speed * (noise(ty)*2-1);
  x += speed;
  //y += vy;
  // println(x,y);
  }
  
  void sight(){
    if(speed>=0&& wolf.y<=y+80&&wolf.y>=y-40 && wolf.x >= x && wolf.x<=x+400){
     menu.dead();
    } else if(speed<=0&& wolf.y<=y+80&&wolf.y>=y-40 && wolf.x <= x && wolf.x>=x-400){
      menu.dead();
    }
  }
  
  void route(){
      if(x <= 200 || x>= 800){
    speed = -speed;
    
      } if (speed >=0){
       LtR = true; 
      } else{
       LtR = false; 
      }
  }
  
  void display(){
    pushMatrix();
   rectMode(CENTER);
   scale(scale);
   if (LtR==true){
   image(farmer,x,y);
   farmer.resize(60,80);
   }else if (LtR==false) {
     image(farmer2,x,y);
   farmer2.resize(60,80);
   }
  popMatrix();
  }
}