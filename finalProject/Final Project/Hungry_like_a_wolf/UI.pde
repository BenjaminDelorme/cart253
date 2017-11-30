class UI{
  float x;
float y;
float health;

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
   health -=0.1;
 }
}