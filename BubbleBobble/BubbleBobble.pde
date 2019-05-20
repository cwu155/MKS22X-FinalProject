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
  PImage dragon = loadImage("bubblun.png");
  
  Player(String n){
    name = n;
    lives = 3;
    score = 0;
    posX = (int)random(20);
    posY = (int)random(20);
    speed = 10;
  }
  
  Player a = new Player("name");
  
  void setup(){ 
    size(1000,800);
  }
  
  void draw(){
    background(255);
    a.display();
  }
  
  void display(){
    dragon.resize(20,20);
    image(dragon,poSX,posY);
  }
}