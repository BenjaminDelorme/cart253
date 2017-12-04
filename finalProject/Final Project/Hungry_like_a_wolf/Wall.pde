class Wall{
  float x1=300;
  float y1=150;
  float length1=335;
  float width1=20;
  
  boolean hit1L;
 Wall(){
   
 }
  void display(){
    rectMode(CENTER);
    fill(0);
    rect(x1,y1,width1,length1);
  }
  
}