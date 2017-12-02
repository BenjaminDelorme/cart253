Wolf wolf;
Sheep[] sheep = new Sheep[10];
UI hp;
UI stamina;
Farmer farmer;
Rabbit[] rabbit = new Rabbit[13];
PImage grass;
PImage test;

int timer = 0;
int timerLength = 1;

void setup() {
  //size(1000,1000);
  fullScreen();
    wolf = new Wolf(width/2, height-100);
    hp = new UI(40, 40, 300);
    stamina = new UI(40,80,100);
      for (int i = 0; i < sheep.length; i++) {
    sheep[i] = new Sheep(floor(random(270,680)), floor(random(40,260)));
      }
      for (int i = 0; i < rabbit.length; i++) {
    rabbit[i] = new Rabbit(floor(random(0, width)), floor(random(0, height)));
      }
     farmer = new Farmer(300,400);
  grass = loadImage("data/images/grass.png");
  test = loadImage("data/images/test.png");
}

void draw() {
  image(grass, 0, 0);
  wolf.display();
  wolf.hitBox();
  wolf.update();
  farmer.display();
  farmer.update();
  farmer.route();
  
  println(mouseX, mouseY);

  for (int i = 0; i<sheep.length; i++) {
    sheep[i].display();
    sheep[i].update();
    
    
    
    // Sheep Dies
    if (dist(wolf.x, wolf.y, sheep[i].x, sheep[i].y)<30) {
      sheep[i].dies();
      timer = millis();
    }
    if (sheep[i].sheepAlive == false) {
      hp.healthSheep = true;
    } 
    if (hp.healthSheep == true && millis() - timer >= timerLength) {
      hp.healthSheep = false;
    }
  }
  
  
  for (int i = 0; i<rabbit.length; i++) {
   rabbit[i].display();
   rabbit[i].update();
   rabbit[i].runAway();
    // Rabbit Dies
    if (dist(wolf.x, wolf.y, rabbit[i].x, rabbit[i].y)<20) {
      rabbit[i].dies();
      timer = millis();
    }
    if (rabbit[i].rabbitAlive == false) {
      hp.healthRabbit = true;
    } 
    if (hp.healthRabbit == true && millis() - timer >= timerLength) {
      hp.healthRabbit = false;
    }
    
    
  }
  image(test, 0, 0);

  hp.displayHP();
  hp.updateHP();
  stamina.displayStam();
  stamina.updateStam();
}




void keyPressed() {
  wolf.keyPressed();
}

void keyReleased() {
  wolf.keyReleased();
}