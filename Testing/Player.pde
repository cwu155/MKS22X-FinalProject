float posX, posY, speedX, speedY;
boolean left, right, up, touching;
PImage img, imgReverse;

class Player implements Displayable, Moveable{
 ArrayList<Bubble> extendBubbles;
 int score, lives;

 Player(float x, float y){
   img = loadImage("../BubbleBobble/Images/bubblun.png");
   posX = x;
   posY = y;
   score = 0; lives = 3;
   extendBubbles = new ArrayList<Bubble>();
 }

 float getX(){
   return posX;
 }

 float getY(){
   return posY;
 }
 
 float getCenterX(){
   return posX + 25; //25 is the width/2
 }
 
 float getCenterY(){
   return posY + 25; //25 is the height/2
 }

 void display(){
  image(img, posX, posY, 50, 50);
 }
 
 boolean onGround(){
   return (posY == 530);
 }

 void move(){
   for (Platform p : platforms){
      touchingPlatform(p);
   }
   
   if (posY >= 530){
     speedY = 0;
     posY = 530;
   }
   
   if (posY == 0){ 
     posY = 600;
   }
   
   if (posY == 600){
     posY = 0;
   }
   
   if (touching){
     speedY = 0;
   }
   
    if (!onGround() && !up){
     speedY = 6;
   } 
   
   if (up){
     speedY = -4; //speedY determines how quick Bub's jump is
   }     
   
   posY += speedY;
  }
 
 void touchingPlatform(Platform p){
  float diffX = (this.getX() + 25) - (p.getX() + p.getWidth()/2);
  float diffY = (this.getY() + 25) - (p.getY() + p.getHeight()/2);
  
  float totalWidths = 25 + p.getWidth()/2;
  float totalHeights = 25 + p.getHeight()/2;
  
  if (Math.abs(diffX) < totalWidths){
    if (Math.abs(diffY) < totalHeights){
      float overlapX = totalWidths - Math.abs(diffX);
      float overlapY = totalHeights - Math.abs(diffY);
      
      if (overlapX >= overlapY){
        if (diffY < 0){
          posY -= overlapY;
          touching = true;
          p.changeColor(p);
        }
      }
    }
  }
 }

}
