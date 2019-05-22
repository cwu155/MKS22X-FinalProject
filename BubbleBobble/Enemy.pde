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
  }
  
  void move(){
  }
}
