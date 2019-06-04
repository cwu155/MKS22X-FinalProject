public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean enemyHit;

class Enemy implements Displayable, Moveable{
  PVector location, velocity;
  float randSpeed;
  int lastTurn;
  boolean touchPlatform, facingR;
  PImage enemy;

  Enemy(float x, float y){
    location = new PVector(x,y);
    randSpeed = (float)Math.random() * (4+1) + -2;
    if (randSpeed > 0){randSpeed = 2;} else {randSpeed = -2;}
    velocity = new PVector(randSpeed,randSpeed);
    if (randSpeed > 0){facingR = true;} else {facingR = false;}
    lastTurn = millis();
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
  
  void update(){
      float randTime = (float)Math.random() * ((6-1) + 1) + 1;
      if (millis() - lastTurn >= randTime * 1000){
        if (velocity.x > 0){velocity.x = 2;} else {velocity.x = -2;}
        velocity.y = -70;
        if (onGround()) velocity.y = -100;
        lastTurn = millis();
      }
      //location.y -= velocity.y;
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
     
     update();
     
     
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
