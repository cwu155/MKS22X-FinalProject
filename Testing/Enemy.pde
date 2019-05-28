public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
class Enemy implements Displayable, Moveable{
  float posX, posY, speedX, speedY;
  boolean touchPlatform;
  PImage enemy;

  Enemy(float x, float y){
    enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
    posX = x;
    posY = y;
    //speedX = 10;
    //enemy = img;
    //enemy.resize(50,50);
  }
  
  float getX(){
    return posX;
  }
  
  float getY(){
    return posY;
  }
  
  void display(){
    image(enemy, posX, posY, 50, 50);
  }
  
  void move(){
     //Checks to see if enemy is touching any platform
     for (Platform p : platforms){
        touchingPlatform(p);
     }
     
     speedY = 5;
     
     if (touchPlatform){
       speedY = 0;
     }
     
     posY += speedY;
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
          posY -= (overlapY + 7.5); //the +7 is for graphics idk
          touchPlatform = true;
          
          //Testing purposes, makes the platform that enemy is on blue
          p.changeColor(p, this);
        }
      }
    }
  }
 }
  
  
}
