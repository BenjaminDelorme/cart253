//Added 3 ball classes
Ball  ball1;
Ball  ball2;
Ball  ball3;

//Added needed variables  for the program
String lost= "Game Over";
float theta = 5;
   
float tx = random(0,100);
float ty = random(0,100);
float x = random(0,100);
float y = random(0,100);


int rectX = 0;
int rectY = 0;

//Created boolean for when the game is on and set it on true when it starts
boolean gameOn = true;




void setup(){
  
 size (500,500); 
surface.setResizable(true);

 //setup the 3 balls used (shoud've done it with arrays, but still don't quite understand them)
 //Changed their variables so they're not all doing the same thing
 ball1 = new Ball(x,y,tx,ty,255);
 ball2 = new Ball(x+width/2,y+height/2,-tx,ty,255);
  ball3 = new Ball(x+width/4,y+height*4,tx,-ty,255);
}

void draw(){

  //if gameOn boolean is true, the ball is displayed
  if(gameOn == true){
      background(0);
      
 ball1.display();
 ball1.update();
 
ball2.display();
ball2.update();

ball3.display();
ball3.update();

//if GameOn is false, screen goes white and Game Over appears
 } if (gameOn == false){
  background(255);
   fill(0);
   textAlign(CENTER);
   textSize(width/10);
   text(lost,width/2, height/4);
 }
  
  
  
  //Added a Matrix here so our object stays in the middle of the screen and rotates
 pushMatrix();
 
 translate(width/2,height/2); 
  rotate(radians(theta));
  rectMode(CENTER);
  rect(rectX,rectY,50,50);
  theta += 1;

 popMatrix();
 
 
 //Added the conditions so if any of the balls touches the object(middle square), gameOn boolean goes to false and game is over
 if(ball1.x <= width/2 +25 && ball1.x >= width/2 -25 && ball1.y <= height/2 +25 && ball1.y >= height/2 -25){
   gameOn = false;
 }if(ball2.x <= width/2 +25 && ball2.x >= width/2 -25 && ball2.y <= height/2 +25 && ball2.y >= height/2 -25){
   gameOn = false;
 }if(ball3.x <= width/2 +25 && ball3.x >= width/2 -25 && ball3.y <= height/2 +25 && ball3.y >= height/2 -25){
   gameOn = false;
 }
 
}