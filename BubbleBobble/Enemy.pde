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
    if(!enemyHit){
      image(ene,posX,posY);
    }
  }
  
  void move(){
    
  }
  
  void hitEnemy(){
    Item food = new Item(posX,posY,values[(int)random(values.length)]);
    items.add(food);
    enemyHit = true;
    enemies.remove(0);
  }
  
  int getX(){
    return posX;
  }
  
  int getY(){
    return posY;
  }
  
  
}