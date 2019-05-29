public static ArrayList<Enemy> enemies = new ArrayList<Enemy>();

class Enemy implements Displayable, Moveable{
  int posX, posY, speed;
  boolean hit = false;
  PImage enemy;

  Enemy(int x, int y, PImage img){
    posX = x;
    posY = y;
    speed = 10;
    enemy = img;
    enemy.resize(50,50);
    //hit = false;
  }
  
  void display(){
    if(!hit){
      image(ene,posX,posY);
    }else{
      Item food = new Item(posX,posY,250);
      food.display();
    }
  }
  
  void move(){
    
  }
  
  void hitEnemy(){
    hit = true;
  }
  
  int getX(){
    return posX;
  }
  
  int getY(){
    return posY;
  }
  
  
}