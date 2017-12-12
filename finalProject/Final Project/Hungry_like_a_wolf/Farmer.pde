

///////////////////////////////////////////////   CLASS FARMER    /////////////////////////////////////////////// 

class Farmer{
  
  ///////PROPRETIES////////
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
  
    ///////METHODS////////
  Farmer(float tempX, float tempY){
    x=tempX;
    y=tempY;
    farmer = loadImage("images/farmer.png");
    farmer2 = loadImage("images/farmer2.png");
    farmer.resize(60,80);
    farmer2.resize(60,80);
  }
  
 ////////Update farmer/make him move
  void update(){
   vx = speed;
  x += speed;
  }
  
   ////////Update farmer2/make him roam around the map(right side)
  void updateAround(){
    vx = speed * (noise(tx)*2-1);
    vy = speed * (noise(ty)*2-1);
    x += vx;
    y += vy;
    tx += 0.01;
    ty += 0.01;
    x = constrain(x,width/2-100,width);
  }
  
   ////////Method that determine if the wolf is near the farmer and if he'll shoot (Smaller radius if sneaking)
  void sightAround(){
    //Danger zone(red cicle showing the zone where you'll get shot)
    if(wolf.sneak){
      ellipseMode(CENTER);
    fill(255,0,0,10);
    ellipse(x+20,y+30,range/2+70,range/2+70);
    }else if (LtR){
    ellipseMode(CENTER);
    fill(255,0,0,20);
    ellipse(x+10,y+30,range+20,range+20);
    } else{
    fill(255,0,0,20);
    ellipse(x+20,y+30,range+20,range+20);
    }
   
   // Statement that tells if you're near enough for the farmer to shoot you
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
  
   ////////Method that create the path farmer1 walks(Left to right)
  void route(){
      if(x <= 400 || x>= 800){
    speed = -speed;
      }
  }
  //////Method that determine if the farmer is going from left to right or right to left (therefore affecting the image displayed)
  void turnAround(){
     if (vx >=0){
       LtR = true; 
      } else{
       LtR = false; 
      } 
  }
  
   ////////Display the farmer to the desired location and make him switch depending on the direction he's walking to
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