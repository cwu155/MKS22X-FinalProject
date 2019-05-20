void setup(){ 
  size(1000,600);
  background(255);
}

void draw(){
  Player a = new Player("name");
  a.display();
  Game g = new Game();
  g.display();
  textSize(25);
  text("Level: "+g.level,30,35);
}
  
class Game{
  int level;
  float time;
  boolean running;
  
  Game(){
    level = 0;
    running = true;
    time = millis()/1000;
  }
  
  Game (int i){
    level = i;
    running = true;
    time = millis()/1000;
  }
  
  void display(){
    if(level == 0){
      background(255,192,203);
      fill(0,0,0);
      rect(30,50,width-60,height-70);
    }
  }
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
