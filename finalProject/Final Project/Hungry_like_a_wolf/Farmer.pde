class Farmer{
  PImage farmer;
  PImage farmer2;

  boolean lost = false;
  float x;
  float y;
  float vx;
  float vy;
  float range = 400;
  boolean LtR=true;
  float tx=random(20,60);
  float ty=random(20,60);
  float speed =2;
  Farmer(float tempX, float tempY){
    x=tempX;
    y=tempY;
    farmer = loadImage("images/farmer.png");
    farmer2 = loadImage("images/farmer2.png");
    farmer.resize(60,80);
    farmer2.resize(60,80);
  }

  void update(){
   vx = speed;
  x += speed;
  }
  
  void updateAround(){
    vx = speed * (noise(tx)*2-1);
    vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;
    tx += 0.01;
    ty += 0.01;
    x = constrain(x,width/2-100,width);
  }
  
  
  void sightAround(){
    if(wolf.sneak){
      ellipseMode(CENTER);
    fill(255,0,0,10);
    ellipse(x+20,y+30,range/2,range/2);
    }else if (LtR){
    ellipseMode(CENTER);
    fill(255,0,0,20);
    ellipse(x+10,y+30,range+20,range+20);
    } else{
    fill(255,0,0,20);
    ellipse(x+20,y+30,range+20,range+20);
    }
    
   if(wolf.sneak ==true && wolf.x >= x-range/3 && wolf.x <= x+range/3 && wolf.y <= y+range/3 && wolf.y>= y-range/3){
    lost=true;
    gun.play();
   } else  if(wolf.sneak ==false && wolf.x >= x-range/2 && wolf.x <= x+range/2 && wolf.y <= y+range/2 && wolf.y>= y-range/2){
    lost=true;
    gun.play();
   } else{
    lost=false;
  }
  }
  
  void sight(){
    if(vx>=0&& wolf.y<=y+80&&wolf.y>=y-40 && wolf.x >= x && wolf.x<=x+550){
     lost =true;
    } else if(vx<=0&& wolf.y<=y+80&&wolf.y>=y-40 && wolf.x <= x && wolf.x>=x-550){
      lost = true;
    } else{
      lost=false;
    }

  }
  
  void route(){
      if(x <= 400 || x>= 800){
    speed = -speed;
      }
  }
  
  void turnAround(){
     if (vx >=0){
       LtR = true; 
      } else{
       LtR = false; 
      } 
  }
  
  void display(){
    pushMatrix();
   rectMode(CENTER);
   scale(1);
   if (LtR==true){
   image(farmer,x,y);
   }else{
     image(farmer2,x,y);
   }
  popMatrix();
  }
}