float posX, posY, speedX, speedY;
boolean left, right, up, touching, facingRight;
PImage img;

class Player implements Displayable, Moveable{
 ArrayList<Bubble> extendBubbles;
 int score, lives;


 Player(float x, float y){
   img = loadImage("Images/bubblun.png");
   facingRight = true;
   posX = x;
   posY = y;
   score = 0;
   lives = 3;
   extendBubbles = new ArrayList<Bubble>();
 }

 float getX(){
   return posX;
 }

 float getY(){
   return posY;
 }

 void display(){
   image(img, posX, posY, 50, 50);
 }

 boolean onGround(){
   return (posY == 530);
 }

 void move(){
   //Checks to see if Bub is touching any platform
   for (Platform p : platforms){
      touchingPlatform(p);
   }
   
   //Bounds
   if (posY >= 530){ //the ground
     speedY = 0;
     posY = 530;
   }
   
   //Vertical wrapping, Bub goes through ground & comes through top or vice versa
   if (posY == 0){ 
     posY = 600;
   }
   
   if (posY == 600){
     posY = 0;
   }
   
   //If Bub touches platform, land on it
   if (touching){
     speedY = 0;
   }
   
   //If Bub is in the air and not jumping, make him fall!
    if (!onGround() && !up){
     speedY = 9;
   } 
   
   
   //Trigger jump
   if (up){
      speedY = -9;  //speedY determines how quick Bub's jump is
   }
   
   //Change y position
   posY += speedY;
  }
 
 void touchingPlatform(Platform p){
  float diffX = (this.getX() + 25) - (p.getX() + p.getWidth()/2);
  float diffY = (this.getY() + 25) - (p.getY() + p.getHeight()/2);
  
  //Minimum distances for the player/platform to collide
  float totalWidths = 25 + p.getWidth()/2;
  float totalHeights = 25 + p.getHeight()/2;
  
  //Are the player and platform colliding? 
  if (Math.abs(diffX) < totalWidths){
    if (Math.abs(diffY) < totalHeights){ //Yes, they are colliding!
      
      //The amount they're overlapping by
      float overlapX = totalWidths - Math.abs(diffX);
      float overlapY = totalHeights - Math.abs(diffY);
      
      if (overlapX >= overlapY){
        if (diffY <= 0){
          posY -= (overlapY + 7.5); //the +7 is for graphics idk
          touching = true;
          
          //Testing purposes, makes the platform that Bub is on red
          p.changeColor(p);
        }
      }
    }
  }
 }

}
