public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();

class Enemy implements Displayable, Moveable{
  PVector location, velocity;
  float randSpeed;
  int lastTurn;
  boolean touchPlatform, facingR, enemyHit;
  PImage enemy;

  Enemy(float x, float y){
    location = new PVector(x,y); 
    randSpeed = (float)Math.random() * (4+1) + -2; //Assigns enemy a random speed, if it's less than 1 make it faster
    if (abs(randSpeed) < 1){
      if (randSpeed > 0){
        randSpeed += 1;
      } else {
        randSpeed -= 1;
      }
    }
    velocity = new PVector(randSpeed,randSpeed);
    if (randSpeed > 0){facingR = true;} else {facingR = false;} //Determines whether enemy is facing left or right
    //lastTurn = millis();
    enemyHit = false; //Enemy has not been hit by a bubble yet
  }
  
  //Accessor methods
  float getX(){
    return location.x;
  }
  
  float getY(){
    return location.y;
  }
  
  void changeHit(Boolean hit){
    enemyHit = hit;
  }
  
  boolean enemyHit(){
    return enemyHit;
  }
  
  boolean onGround(){
   return (location.y >= 525);
  }

  
  void display(){
    if(!enemyHit){
      if (velocity.x < 0){
        enemy = loadImage("../BubbleBobble/Images/enemyLeft.png");
      } else {
        enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
      }
      image(enemy, location.x, location.y, 50, 50);   
    }
  }    
  
  //Makes the enemy jump every (random #) of seconds
  void update(){
      float randTime = (float)Math.random() * ((10-2) + 1) + 2;
      if (millis() - lastTurn >= randTime * 1000 * abs(randSpeed)){
        if(touchPlatform && location.y > a.topPlatform().getY()){
          velocity.y = -70;
        }
        if (onGround()) velocity.y = -100;
        lastTurn = millis();
      }
  }
    
  
  void move(){
    //Checks to see if enemy is touching any platform
     for (Platform p : platforms){
        touchingPlatform(p);
     }      
     
     //If touching platform, stop!
     if (touchPlatform){
       velocity.y = 0;
       touchPlatform = false;
     }
     
     if (onGround()){
       velocity.y = 0;
     }     
     
     //Bounds
     if (location.x > 915 || location.x < 40){
       velocity.x *= -1;
     }
    
     
     //If not on a platform and not on the ground, drop!
     if (!touchPlatform && !onGround()){
       velocity.y = 5;
     }
     
     //Jump randomly
     update();
     
     location.x += velocity.x;
     location.y += velocity.y;
     
  }
  
  //If the enemy is hit by a bubble (called in Bubble class), spawn an item and remove the enemy
  void hitEnemy(){
    Item food = new Item((int)this.getX(),(int)this.getY(),pointVals[(int)random(pointVals.length)]);
    items.add(food);
    enemies.remove(this);
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
          location.y -= (overlapY + 2); //the +2 is for graphics idk
          touchPlatform = true;
          
          //Testing purposes, makes the platform that enemy is on green
        //  p.changeColor(p, this);
        }
      }
    }
  }
 }
  
}
