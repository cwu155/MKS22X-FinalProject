float posX, posY;
float speedX, speedY;
float gravity = 0.1;
boolean left,right,up,down;
boolean reachedMax;


 
class Player{
 PImage img;
  
 Player(float x, float y){
   img = loadImage("bub.png");
   posX = x;
   posY = y;
 }
  
 void display(){
   image(img, posX, posY, 50, 50); 
 }
 
 void jump(){
   if (up){
     speedY = -5;

     if (posY == 300){
       speedY = 0;
       reachedMax = true;
     }
     if (reachedMax){
       speedY = 5;
       if (posY > 500){speedY = 0;}
     }
       
     posY += speedY;
     speedY += gravity;    
   }
  }
}


void setup(){
  size(600,600);
  posX = 100; 
  posY = 500;
  left = false; right = false; up = false; down = false;
}

void draw(){
  background(0);
  Player p = new Player(posX, posY);
  p.display();
  p.jump();
}

void keyPressed(){
    if (key == 'd'){ //move right
      speedX = 5;
      posX += speedX;
    }
    if (key == 'a'){ //move left
      speedX = -5;
      posX += speedX;
    }  
    if (key == 'w'){ //trigger jump
      up = true;
    }
 }
