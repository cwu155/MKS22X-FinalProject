float posX, posY, speedX, speedY;
boolean left, right, up, touching, facingR = true;
int lives, count=0, upCount=0;
PImage img;

class Player implements Displayable, Moveable, Collideable{
 int score; float min; Platform toReturn;


 Player(float x, float y){
   img = loadImage("../BubbleBobble/Images/bubblun.png");
   posX = x;
   posY = y;
   score = 0;
   lives = 3;
 }
 
 //Accessor methods
 float getX(){
   return posX;
 }

 float getY(){
   return posY;
 }
 
 boolean getDir(){
   return facingR;
 }


 void display(){
   image(img, posX, posY, 50, 50);
 }
 
 //Checks to see if player is on ground
 boolean onGround(){
   return (posY == 530);
 }
 
 void changeDir(boolean b){
   facingR = b;
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
   
   if (posY <= 50){ //top of the map
     speedY = -9;
     posY = 50;
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
    if ((!onGround() && !up) || posY <= 50){ //or if above map
     speedY = 9;
   } 
   
   
   //Trigger jump
    if (up){
        speedY = -8;  //speedY determines how quick Bub's jump is
    }
   
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
         // p.changeColor(p);
        }
      }
    }
  }
 }
 
 boolean touching(){ //Is the player touching an item?
   for(Item i : items){
     if((abs(i.getX() - posX)) < 50 && (abs(i.getY() - posY)) < 25){
       i.hitItem();
       return true;
     }
   }
   return false;
 }
 
 boolean touchingE(){ //Is the player touching an enemy?
   for(Enemy e : enemies){
     if((abs(e.getX() - posX)) < 50 && (abs(e.getY() - posY)) < 25){
       if(lives==3){
         lives=2;
       }
       count++;
       if(count>75){
         lives--;
         count = 0;
       }
       return true;
     }
   }
   return false;
 }
 
 void addPoints(int p){
   score += p;
 }
 
 void removePoints(){
   score = 0;
 }
 
 //Returns the ycor of the center of the top platform of the level
 Platform topPlatform(){
   min = 1000;
   for (Platform p : platforms){
     if (p.getCenterY() <= min){
       min = p.getCenterY();
       toReturn = p;
     }
   }
   return toReturn;
 }
 

}
