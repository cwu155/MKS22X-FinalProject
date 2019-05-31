public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean enemyHit;

class Enemy implements Displayable, Moveable{
  PVector location, velocity;
  float eposX, eposY, espeedX, espeedY;
  boolean touchPlatform, facingR;
  PImage enemy;

  Enemy(float x, float y, PImage enemy){
    location = new PVector(x,y);
    velocity = new PVector(0,1);
    eposX = x;
    eposY = y;
    //speed = 10;
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
  
  void move(){
    //Checks to see if enemy is touching any platform
     for (Platform p : platforms){
        touchingPlatform(p);
     }
     
     //If not on a platform and not on the ground, move!
     if (!touchPlatform && !onGround()){
       espeedY = 5;
     }
     
     //If touching platform, stop!
     if (touchPlatform){
       espeedY = 0;
     }
     
     if (eposX <= 915 && eposX >= 40){
       eposX += espeedX;
       eposY += espeedY;
     }
     
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
          
          //Testing purposes, makes the platform that enemy is on blue
          p.changeColor(p, this);
        }
      }
    }
  }
 }
  
}
