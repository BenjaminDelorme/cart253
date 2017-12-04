class Menus{
  
  String dead = "You are dead";
  
  Menus(){
    
    
  }
  
  void dead(){
    background(0);
    textAlign(CENTER);
    text(dead,width/2,height/2);
    farmer.speed = 0;
    
  }
}