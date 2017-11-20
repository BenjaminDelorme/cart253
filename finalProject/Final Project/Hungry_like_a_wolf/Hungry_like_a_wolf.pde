Wolf wolf;




void setup() {
  size(1000,1000);
  //fullScreen();
  wolf = new Wolf(width/2,height/2);

}

void draw() {
  background(255);
  wolf.display();
  wolf.update();
  wolf.y = constrain(wolf.y,0,height);
}




void keyPressed() {
  wolf.keyPressed();
}

void keyReleased() {
 wolf.keyReleased();
}