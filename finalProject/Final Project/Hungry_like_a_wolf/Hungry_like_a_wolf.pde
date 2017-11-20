Wolf wolf;


PImage wolf1;

void setup() {
  fullScreen();
  wolf = new Wolf();
  wolf1 = loadImage("data/images/wolf1.png");
}

void draw() {
  background(255);
  wolf.update();
  wolf.display();
}




void keyPressed() {
  wolf.keyPressed();
}

void keyReleased() {
 wolf.keyReleased();
}