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
  wolf.update();
  wolf.y = constrain(wolf.y,0,height);
  
  for (int i = 0; i<sheep.length; i++){
  sheep[i].display();
  sheep[i].update();
  
  }
 
}




void keyPressed() {
  wolf.keyPressed();
}

void keyReleased() {
 wolf.keyReleased();
}