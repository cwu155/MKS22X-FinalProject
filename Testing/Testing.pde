static float xPos;
static float yPos;
float speed;

class Player{
  PImage img;
  float x,y;
  
  Player(float x, float y){
    img = loadImage("bub.png");
    xPos = x;
    yPos = y;
  }
  
  void display(){
    image(img, xPos, yPos, 50, 50);
  }
    
}

void keyPressed(){
  println(key);
  println(xPos);
  if (key == 'd'){
    xPos += speed;
  }
  
  if (key == 'a'){
    xPos -= speed;
  }
}

void setup(){
  size(600,600);
  xPos = 50;
  yPos = 50;
  speed = 10;
}

void draw(){
  Player p = new Player(xPos,yPos);
  p.display();
}
