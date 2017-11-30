Wolf wolf;
Sheep[] sheep = new Sheep[20];
UI ui;
PImage grass;
PImage test;

int timer = 0;
int timerLength = 1;

void setup() {
  //size(1000,1000);
  fullScreen();
  wolf = new Wolf(width/2,height/2);
  ui = new UI(40,40,300);
  for (int i = 0; i < sheep.length; i++){
  sheep[i] = new Sheep(width/4 +floor(noise(-500,500)) ,150-floor(random(-60,60)));
  }
  grass = loadImage("data/images/grass.png");
  test = loadImage("data/images/test.png");
}

void draw() {
  image(grass,0,0);
  wolf.display();
  wolf.hitBox();
  wolf.update();
  wolf.y = constrain(wolf.y,0,height);
  
  println(mouseX,mouseY);
  
  for (int i = 0; i<sheep.length; i++){
  sheep[i].display();
  sheep[i].update();
  
  
  // Sheep Dies
 
  
  if(dist(wolf.x,wolf.y,sheep[i].x,sheep[i].y)<30){
   sheep[i].dies();
   timer = millis();
  }
  
  if(sheep[i].sheepAlive == false){
    ui.gainHealth = true;
  } if (ui.gainHealth == true && millis() - timer >= timerLength){
   ui.gainHealth = false; 
  }
  }
 image(test,0,0);
 
   ui.display();
   ui.update();
}




void keyPressed() {
  wolf.keyPressed();
}

void keyReleased() {
 wolf.keyReleased();
}