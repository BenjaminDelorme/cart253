class Text{
void introText(){
  
String Title = "Bullet Pong";
String HowTo = "How to play";
String LeftP = "Left Player";
String RightP = "Right Player";

String UpL = "Up = W";
String DownL = "Down = S";
String ShootL = "Shoot = D";


String UpR = "Up = Up Key";
String DownR = "Down = Down Key";
String ShootR = "Shoot = Left Key";

String start = "Press Space to start";

String win = "First to 5 wins";




  //Title
 textAlign(CENTER);
 textSize(80);
 fill(179,134,0);
 text(Title, width/2, 90);
 stroke(0,20);
 //How to play
 textSize(35);
 fill(0);
 text(HowTo, width/2, 160);
 //space to start
 text(start,width/2,490);
 //how to win
 textSize(25);
 text(win,width/2,400);
 
 
 
 //Player left
textAlign(LEFT);

fill(113,3,3);
textSize(26);
text(LeftP,width/4 - 80, 240);

textSize(15);
text(UpL,width/4 - 80, 280);
text(DownL,width/4 - 80, 300);
text(ShootL,width/4 - 80, 320);





 //Player right
textAlign(LEFT);

fill(30,69,0);
textSize(26);
text(RightP,width/2 + 120, 240);

textSize(15);
text(UpR,width/2 + 120, 280);
text(DownR,width/2 + 120, 300);
text(ShootR,width/2 + 120, 320);
}

//Left Player won
void playerLeftWin(){
  textAlign(CENTER);
 textSize(70);      
    image(background,-25,-15);
    background.resize(width +50,height +30);
    fill(179,134,0);
    text(Over, width/2, height/2);
    textSize(40);
    fill(113,3,3);
    text(leftWin, width/2, height/2 + 80);
    text(scoreLeft, width/2 - 50, height/2 +130);
    fill(30,69,0);
    text(scoreRight, width/2 + 50, height/2 +130);  
}

//Right Player won
void playerRightWin(){
  textAlign(CENTER);
   textSize(70);
    image(background,-25,-15);
    background.resize(width +50,height +30);
    fill(179,134,0);
    text(Over, width/2, height/2);
    textSize(40);
    fill(30,69,0);
    text(rightWin, width/2, height/2 + 80);
    text(scoreRight, width/2 + 50, height/2 +130);
    fill(113,3,3);
    text(scoreLeft, width/2 - 50, height/2 +130);
}
}