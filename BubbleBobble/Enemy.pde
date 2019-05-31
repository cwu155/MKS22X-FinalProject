public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean enemyHit;

class Enemy implements Displayable, Moveable{
  float posX, posY, speed;
  boolean facingR;
  PImage enemy;

  Enemy(float x, float y, PImage enemy){
    posX = x;
    posY = y;
    speed = 10;
    facingR = true;
    enemy = loadImage("../BubbleBobble/Images/enemy1.gif");
  }
  
  float getX(){
    return posX;
  }
  
  float getY(){
    return posY;
  }
  
  void display(){
    if(!enemyHit){
      if (!facingR){
        enemy = loadImage("../BubbleBobble/Images/enemyLeft.png");
      }
      image(enemy, posX, posY, 50, 50);
    }
  }
  
  void move(){
    
  }
  
  void hitEnemy(){
    Item food = new Item((int)posX,(int)posY,values[(int)random(values.length)]);
    items.add(food);
    enemyHit = true;
    enemies.remove(0);
  }
  
}
