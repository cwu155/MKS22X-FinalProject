public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean enemyHit;
class Enemy implements Displayable, Moveable{
  int posX, posY, speed;
  PImage enemy;

  Enemy(int x, int y, PImage img){
    posX = x;
    posY = y;
    speed = 10;
    enemy = img;
    enemy.resize(50,50);
  }
  
  void display(){
    image(ene,posX,posY);
  }
  
  void move(){
    
  }
  
  void hitEnemy(){
    Item food = new Item(posX,posY,10);
    items.add(food);
    enemies.remove(this);
  }
  
  int getX(){
    return posX;
  }
  
  int getY(){
    return posY;
  }
  
  
}
