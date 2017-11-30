class UI{
  float x;
float y;
float health;
boolean gainHealth = false;

  UI(float tempX, float tempY,float healthBar) {
  x = tempX;
  y = tempY;
  health = healthBar;
}
  
 void display(){
  rectMode(CORNER);
   fill(255,0,0);
   stroke(2);
   rect(x,y,health,20);
 }
 void update(){
   
  if (gainHealth == true){
    health +=1;
  } else{
     health -=0.1;
  }
    
  
 }
}