public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean enemyHit;

class Enemy implements Displayable, Moveable{
  float eposX, eposY, espeedX, espeedY, randSpeed;
  boolean touchPlatform, facingR;
  PImage enemy;

  Enemy(float x, float y, PImage enemy){
    eposX = x;
    eposY = y;
    facingR = true;
    enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
  }
  
  float getX(){
    return eposX;
  }
  
  float getY(){
    return eposY;
  }
  
  boolean onGround(){
   return (eposY == 530);
  }
  
  void display(){
    if(!enemyHit){
      if (!facingR){
        enemy = loadImage("Images/enemyLeft.png");
      } else {
        enemy = loadImage("Images/enemy1.gif");
      }
      image(enemy, eposX, eposY, 50, 50);   
    }
  }
  
  void checkBub(){
    //if(a.getX() == eposX && touchPlatform){
    //  int r = (int)random(2);
    //  if(r==0){
    //    facingR = false;
    //    espeedX = -1.5;
    //  }else{
    //    facingR = true;
    //    espeedX = 1.5;
    //  }
    //}
    
    if (randSpeed < 1){
     facingR = false;
     espeedX = -1.5;
   } else {
     facingR = true;
     espeedX = 1.5;
   }
   
 
    
    //If Bub is to the left, move towards the left
     //if (a.getX() < eposX && touchPlatform){
     //  facingR = false;
     //  espeedX = -1.5;
     //}
    
     
    //If Bub is to the right, move towards the right
     //if (a.getX() > eposX && touchPlatform){
     //  facingR = true;
     //  espeedX = 1.5;
     //}
     
     //If Bub is below, move down
     if (a.getY() > eposY){
       espeedY = 5;
     }
     
     //If Bub is above, move up when there's a platform nearby
     if (a.getY() < eposY){
      espeedX = 0;
      espeedY -= 8;
    }
  }  
  
  void move(){
    //Checks to see if enemy is touching any platform
     for (Platform p : platforms){
        touchingPlatform(p);
     }   
     
     //If touching platform, stop!
     if (touchPlatform){
       espeedY = 0;
     }
     
     //Follows Bub!
     checkBub();
     
     //If not on a platform and not on the ground, move!
     if (!touchPlatform && !onGround()){
       espeedY = 5;
     }
     
     if (eposX > 915 || eposX < 40){
       espeedX *= -1;
     }
     
     //if (eposX <= 915 && eposX >= 40){
       eposX += espeedX;
       eposY += espeedY;
     //}
     
  }
  
  void hitEnemy(){
    Item food = new Item((int)eposX,(int)eposY,values[(int)random(values.length)]);
    items.add(food);
    enemyHit = true;
    enemies.remove(0);
  }
  
  void touchingPlatform(Platform p){
  float diffX = (eposX + 25) - (p.getX() + p.getWidth()/2);
  float diffY = (eposY + 25) - (p.getY() + p.getHeight()/2);
  
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
          eposY -= (overlapY + 1); //the +1 is for graphics idk
          touchPlatform = true;
          
          //Testing purposes, makes the platform that enemy is on green
          p.changeColor(p, this);
        }
      }
    }
  }
 }
  
}
