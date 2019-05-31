public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();

class Enemy implements Displayable, Moveable{
  PVector location, velocity;
  float posX, posY, speedX, speedY;
  boolean touchPlatform, facingR, headR;
  PImage enemy;

  Enemy(float x, float y){
    location = new PVector(x,y);
    velocity = new PVector(0,1);
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
  
  void bounds(){
    if (location.x >= 915 || location.x <= 40){
      velocity.x *= -1;
    }
  }
  
  void display(){
    if (facingR){
      enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
    } else {
      enemy = loadImage("../BubbleBobble/Images/enemyLeft.png");
    }
    image(enemy, location.x, location.y, 50, 50);
  }
  
  //Should return where the nearest Platform is so it can jump
  Platform nearestPlatform(){
    return platforms.get(0);
  }
  
  void checkBub(){
    //Yikes   
    //If Bub is to the left, move towards the left
     if (a.getX() < location.x && touchPlatform){
       facingR = false;
       velocity.x = -1.5;
     }
     
    //If Bub is to the right, move towards the right
     if (a.getX() > location.x && touchPlatform){
       facingR = true;
       velocity.x = 1.5;
     }
     
    //If Bub and enemy are at equal x-coordinates, don't move
    //Temporary because enemy should move to Bub's y-coordinate
     //if (a.getX() == this.getX()){
     //  posX += 0;
     //  speedX = 0;
     //}
     
     //If Bub is below, move down
     if (a.getY() > location.y){
       velocity.y = 5;
     }
     
     //If Bub is above, move up when there's a platform nearby
     if (a.getY() < location.y){
      velocity.x = 0;
      velocity.y -= 9;
    }
  }  
  
  
  void move(){
     //Checks to see if enemy is touching any platform
     for (Platform p : platforms){
        touchingPlatform(p);
     }
     
     //Bounds
     if (location.y >= 530){ //the ground
       velocity.y = 0;
       location.y = 530;
     }
   
     if (location.y <= 50){ //top of the map
       velocity.y = -9;
       location.y = 50;
     }  
     
     //If touching platform, stop!
     if (touchPlatform){
       velocity.y = 0;
     }
     
     //Follow Bub!
     checkBub();
     
     //If not on a platform and not on the ground, move!
     if (!onGround() && !touchPlatform){
       velocity.y = 5;
     }
 
     
     if (location.x <= 915 && location.x >= 40){
       location.x += velocity.x;
       location.y += velocity.y;
     }
  }
  
  void touchingPlatform(Platform p){
  float diffX = (location.x + 25) - (p.getX() + p.getWidth()/2);
  float diffY = (location.y + 25) - (p.getY() + p.getHeight()/2);
  
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
          location.y -= (overlapY + 1); //the +1 is for graphics idk
          touchPlatform = true;
          
          //Testing purposes, makes the platform that enemy is on blue
          p.changeColor(p, this);
        }
      }
    }
  }
 }
  
  
}
