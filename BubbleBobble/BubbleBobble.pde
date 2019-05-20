void setup(){ 
  size(1000,600);
  background(255);
}

void draw(){
  Game g = new Game();
  g.display();
  Player a = new Player("name");
  a.display();
  //level + score
  textSize(25);
  textAlign(LEFT);
  text("Level: "+g.level,30,35);
  textAlign(RIGHT);
  text("Score: "+a.score,width-30,35);
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
      fill(255,192,203);
      noStroke();
      rect(30,250,100,20);
      rect(30,350,100,20);
      rect(30,450,100,20);
      rect(width-30-100,250,100,20);
      rect(width-30-100,350,100,20);
      rect(width-30-100,450,100,20);
      rect(180,250,640,20);
      rect(180,350,640,20);
      rect(180,450,640,20);
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
    posX = 30;
    posY = height-50-20;
    speed = 10;
    extendBubbles = new ArrayList<Bubble>();
  }
  
  void display(){
    dragon.resize(50,50);
    image(dragon,posX,posY);
  }
  
  void keyPressed(){
    if(key == 'a'){
      posY -= 10;
    }
    if(keyCode == LEFT){
      posX -= 10;
    }
    if(keyCode == RIGHT){
      posX += 10;
    }
  }
}
