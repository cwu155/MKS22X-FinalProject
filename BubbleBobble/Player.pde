class Player implements Displayable, Moveable{
  int lives,score,posX,posY,speed;
  ArrayList<Bubble> extendBubbles;
  String name;
  PImage dragon;
  
  Player(String n, PImage img){
    dragon = img;
    dragon.resize(50,50);
    name = n;
    lives = 3;
    score = 0;
    posX = 30;
    posY = height-50-20;
    speed = 10;
    extendBubbles = new ArrayList<Bubble>();
  }
  
  void display(){
    image(dragon,posX,posY);
  }
  
  void keyPressed(){
    if(key == 'a'){
      posY -= speed;
    }
    if(keyCode == LEFT){
      posX -= speed;
    }
    if(keyCode == RIGHT){
      posX += speed;
    }
    if(key == 'a'){
      Bubble b = new Bubble(a.posX+50,a.posY+25);
      b.display();
      b.move();
    }
  }
  
  void move(){
  }
}