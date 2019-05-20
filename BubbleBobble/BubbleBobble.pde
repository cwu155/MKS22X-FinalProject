void setup(){ 
  size(1000,600);
  background(255);
}

void draw(){
  Player a = new Player("name");
  a.display();
}
  
class Game{
  int lives;
  float time;
  boolean running;
}

class Item{
}

class Bubble{
}

class Enemy{
}

class Player{
  int lives,score,posX,posY,speed;
  ArrayList<Bubble> extendBubbles;
  String name;
  PImage dragon;
  
  Player(String n){
    dragon = loadImage("bubblun.png");
    name = n;
    lives = 3;
    score = 0;
    posX = 0;
    posY = height-50; //50 is size of dragon
    speed = 10;
    extendBubbles = new ArrayList<Bubble>();
  }
  
  void display(){
    dragon.resize(50,50);
    image(dragon,posX,posY);
  }
}
