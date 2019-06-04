public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean enemyHit;

class Enemy implements Displayable, Moveable{
  float eposX, eposY, espeedX, espeedY, randSpeed;
  long lastTurn;
  PVector location, velocity;
  boolean touchPlatform, facingR;
  PImage enemy;

  Enemy(float x, float y, PImage enemy){
    location = new PVector(x,y);
    velocity = new PVector(-2,2);
    facingR = true;
    enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
    randSpeed = (float)Math.random() * (2);
  }
  
  float getX(){
    return location.x;
  }
  
  float getY(){
    return location.y;
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
  
  void jump(){ //unused for now
    println("jump!");
    lastTurn = System.currentTimeMillis();
    if (System.currentTimeMillis() - lastTurn >= 100) {
    velocity.y -= 8;
    lastTurn = System.currentTimeMillis();
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
     
     if (location.x > 915 || location.x < 40){
       velocity.x *= -1;
     }
     
     //If not on a platform and not on the ground, drop!
     if (!touchPlatform && !onGround()){
       velocity.y = 5;
     }
     
   
     location.x += velocity.x;
     //println("Location: " + location.y);
     location.y += velocity.y;
      
  }
  
  void hitEnemy(){
    Item food = new Item((int)location.x,(int)location.y,values[(int)random(values.length)]);
    items.add(food);
    enemyHit = true;
    enemies.remove(0);
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
          location.y -= (overlapY + 2); //the +1 is for graphics idk
          touchPlatform = true;
          
          //Testing purposes, makes the platform that enemy is on green
          p.changeColor(p, this);
        }
      }
    }
  }
 }
  
}
