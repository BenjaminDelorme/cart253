Wolf wolf;
Sheep sheep;
PImage grass;



void setup() {
  size(1000,1000);
  //fullScreen();
  wolf = new Wolf(width/2,height/2);
  sheep = new Sheep(100,200);
  grass = loadImage("data/images/grass.png");

}

void draw() {
  image(grass,0,0);
  wolf.display();
  wolf.update();
  wolf.y = constrain(wolf.y,0,height);
  
  sheep.display();
  sheep.update();
}




void keyPressed() {
  wolf.keyPressed();
}

void keyReleased() {
 wolf.keyReleased();
}