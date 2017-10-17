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
 textSize(60);
 fill(185,34,190);
 text(Title, width/2, 70);
 
 //How to play
 textSize(30);
 fill(0);
 text(HowTo, width/2, 140);
 //space to start
 text(start,width/2,490);
 //how to win
 textSize(25);
 text(win,width/2,400);
 
 
 
 //Player left
textAlign(LEFT);

fill(55);
textSize(26);
text(LeftP,width/4, 230);

textSize(15);
text(UpL,width/4, 280);
text(DownL,width/4, 300);
text(ShootL,width/4, 320);





 //Player right
textAlign(LEFT);

fill(255);
textSize(26);
text(RightP,width/2 + 30, 230);

textSize(15);
text(UpR,width/2 + 30, 280);
text(DownR,width/2 + 30, 300);
text(ShootR,width/2 + 30, 320);
}


void playerLeftWin(){
  textAlign(CENTER);
 textSize(60);      
    image(background,0,0);
    background.resize(width,height);
    fill(185,34,190);
    text(Over, width/2, height/2);
    textSize(30);
    fill(55);
    text(leftWin, width/2, height/2 + 40);
    text(scoreLeft, width/2 - 50, height/2 +100);
    fill(255);
    text(scoreRight, width/2 + 50, height/2 +100);  
}

void playerRightWin(){
  textAlign(CENTER);
   textSize(60);
    image(background,0,0);
    background.resize(width,height);
    fill(185,34,190);
    text(Over, width/2, height/2);
    textSize(30);
    fill(255);
    text(rightWin, width/2, height/2 + 40);
    text(scoreRight, width/2 + 50, height/2 +100);
    fill(55);
    text(scoreLeft, width/2 - 50, height/2 +100);
}
}