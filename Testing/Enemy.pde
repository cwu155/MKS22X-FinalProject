public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();

class Enemy implements Displayable, Moveable{
  float posX, posY, speedX, speedY;
  boolean touchPlatform, facingR;
  PImage enemy;

  Enemy(float x, float y){
    posX = x;
    posY = y;
    facingR = true;
    enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
  }
  
  float getX(){
    return posX;
  }
  
  float getY(){
    return posY;
  }
  
  boolean onGround(){
   return (posY == 530);
  }
  
  void display(){
    if (facingR){
      enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
    } else {
      enemy = loadImage("../BubbleBobble/Images/enemyLeft.png");
    }
    image(enemy, posX, posY, 50, 50);
  }
  
  //Should return where the nearest Platform is so it can jump
  Platform nearestPlatform(){
    //If Bub is above
    
    return platforms.get(0);
  }
  
  void checkBub(){
    //Yikes   
    //If Bub is to the left, move towards the left
     if (a.getX() < this.getX() && touchPlatform){
       facingR = false;
       speedX = -3;
     }
     
    //If Bub is to the right, move towards the right
     if (a.getX() > this.getX() && touchPlatform){
       facingR = true;
       speedX = 3;
     }
     
    //If Bub and enemy are at equal x-coordinates, don't move
    //Temporary because enemy should move to Bub's y-coordinate
     if (a.getX() == this.getX() && touchPlatform){
       speedX = 0;
     }
     
     //If Bub is below, move down
     if (a.getY() > this.getY()){
       speedY = 5;
     }
     
     //If Bub is above, move up when there's a platform nearby
     if (a.getY() < this.getY()){
      speedX = 0;
      speedY -= 9;
    }
  }  
  
  
  void move(){
     //Checks to see if enemy is touching any platform
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
     
     //If touching platform, stop!
     if (touchPlatform){
       speedY = 0;
     }
     
     //If not on a platform and not on the ground, move!
     if (!onGround()){
       speedY = 5;
     }
     
     //Follow Bub!
     checkBub();
 
     
     if (posX <= 915 || posX > 40){
       posX += speedX;
       posY += speedY;
       if (posX <= 40){
         posX += 2;
       }
     }
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
          posY -= (overlapY + 1); //the +1 is for graphics idk
          touchPlatform = true;
          
          //Testing purposes, makes the platform that enemy is on blue
          p.changeColor(p, this);
        }
      }
    }
  }
 }
  
  
}
