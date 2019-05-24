float posX, posY, speedX, speedY;
boolean up,reachedMax;

class Player implements Displayable, Moveable{
 PImage img;
 ArrayList<Bubble> extendBubbles;
 int score, lives;


 Player(float x, float y){
   img = loadImage("Images/bubblun.png");
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

 void move(){
   if (up){
      speedY = -10; //speedY determines how quick Bub's jump is
      
     if (posY == 300){ //replace 300 with how far you want Bub to jump
       speedY = 0;
       reachedMax = true; //you reached the height of your jump, go back down!
     }
     if (reachedMax){
       speedY = 10;
       if (posY > 50){
         speedY = 0;
       }
     }
     if((posX >= 130 && posX <= 180) || (posX >= 840 && posY <= 890)){
       speedY = 10;
     }
     if(posY >= 530){
       speedY = 0;
     }
     posY += speedY;
   }
   
  }
}