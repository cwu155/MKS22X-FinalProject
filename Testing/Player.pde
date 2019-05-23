float posX, posY, speedX, speedY;
boolean up, reachedMax;

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

 void display(){
   image(img, posX, posY, 50, 50);
 }

 void move(){
   if (up){
     speedY = -5; //speedY determines how quick Bub's jump is

     if (posY == 350){ //replace 400 with how far you want Bub to jump
       speedY = 0;
       reachedMax = true; //you reached the height of your jump, go back down!
     }
     if (reachedMax){
       speedY = 10;
       if (posY >= 530){speedY = 0;} //replace 500 for where the yCor of the floor is
     }
     posY += speedY;
   }
  }
  
 //boolean touching(){
 //  for (int i = 0; i < platforms.size(); i++){
 //    if (this.x
 //}
      
  
}
