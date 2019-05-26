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
   
   if (touching){
     println("Touched!!");
       speedY = 0;
     }

   if (up){
     speedY = -5; //speedY determines how quick Bub's jump is
     
     if (posY == 200){ //replace 400 with how far you want Bub to jump
       speedY = 0;
       reachedMax = true; //you reached the height of your jump, go back down!
     }
     if (reachedMax){
       speedY = 5;
       if (posY >= 300){speedY = 0;} //replace 500 for where the yCor of the floor is
     }
          
     
   }
   
   posY += speedY;
  }

 void collided(){
   for (Platform platform : platforms){
       if (touchingPlatform(platform)){
         touching = true;
        }
      }
 }
 
 boolean touchingPlatform(Platform p){
     if ((this.getCenterY() + p.getHeight() == p.getCenterY() - p.getHeight()/2 - 5)){
       return true;
   }
   return false;
 }
      
  
}
