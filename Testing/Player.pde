float posX, posY, speedX, speedY;
boolean up, reachedMax, touching;

class Player implements Displayable, Moveable{
 PImage img;
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

 void move(){
   collided();
   
   if (posY == 0){
     posY = 600;
   }
   
   if (posY == 600){
     posY = 0;
   }
   
   if (posY == 530){
     speedY = 0;
   }
   
   if (touching){
     println("Touched!!");
       speedY = 0;
     }

   if (up){
     speedY = -5; //speedY determines how quick Bub's jump is
     
     //if (posY == 0){ //replace 400 with how far you want Bub to jump
     //  speedY = 0;
     //  reachedMax = true; //you reached the height of your jump, go back down!
     // }
      
     //if (reachedMax){
     //  speedY = 5;
     //  if (posY >= 300){
     //    speedY = 0;
     //  } //replace 500 for where the yCor of the floor is
     //}
   }
     
     if (posY != 530 && !up && !touching){
       speedY = 5;
     }      
   
   posY += speedY;
  }

 void collided(){
   for (Platform platform : platforms){
       if (touchingPlatform(platform)){
         platform.changeColor(platform);
         touching = true;
        }
      }
 }
 
 boolean touchingPlatform(Platform p){
  float diffX = (this.getX() + 25) - (p.getX() + p.getWidth()/2);
  float diffY = (this.getY() + 25) - (p.getY() + p.getHeight()/2);
  
  float totalWidths = 25 + p.getWidth()/2;
  float totalHeights = 25 + p.getHeight()/2;
  
  if (Math.abs(diffX) < totalWidths){
    if (Math.abs(diffY) < totalHeights){
      float overlapX = totalWidths - Math.abs(diffX);
      float overlapY = totalHeights - Math.abs(diffY);
      
      if (overlapX >= overlapY){
        if (diffY <= 0){
          posY -= overlapY;
          return true;
        } 
      }
    }
  }
  return false;
 }

      
  
}
