float posX, posY;
float speedX, speedY;
boolean up;
boolean reachedMax; //helps with the jump method

class Player{
 PImage img;
  
 Player(float x, float y){
   img = loadImage("bub.png");
   posX = x;
   posY = y;
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
 
 void jump(){
   if (up){
     speedY = -10; //speedY determines how quick Bub's jump is

     if (posY == 300){ //replace 300 with how far you want Bub to jump
       speedY = 0;
       reachedMax = true; //you reached the height of your jump, go back down!
     }
     if (reachedMax){
       speedY = 10;
       if (posY > 500){speedY = 0;} //replace 500 for where the yCor of the floor is
     }       
     posY += speedY;
   }
  }
}
