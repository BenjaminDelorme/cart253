Wolf wolf;
Sheep[] sheep = new Sheep[20];
PImage grass;



void setup() {
  size(1000,1000);
  //fullScreen();
  wolf = new Wolf(width/2,height/2);
  for (int i = 0; i < sheep.length; i++){
  sheep[i] = new Sheep(width/2 +floor(noise(-500,500)) ,150-floor(random(-60,60)));
  }
  grass = loadImage("data/images/grass.png");

}

void draw() {
  image(grass,0,0);
  wolf.display();
  wolf.hitBox();
  wolf.update();
  wolf.y = constrain(wolf.y,0,height);
  
  for (int i = 0; i<sheep.length; i++){
  sheep[i].display();
  sheep[i].update();
  
  //if( wolf.y >= sheep[i].y-10 && wolf.y <= sheep[i].y+10 && wolf.x >= sheep[i].x-50 && wolf.x <= sheep[i].x+50){
  
  // sheep[i].dies();
  //}
  
  if(dist(wolf.x,wolf.y,sheep[i].x,sheep[i].y)<40){
  
   sheep[i].dies();
  }
  }
 
}




void keyPressed() {
  wolf.keyPressed();
}

void keyReleased() {
 wolf.keyReleased();
}