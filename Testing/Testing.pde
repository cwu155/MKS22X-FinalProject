static float xPos;
static float yPos;

class Player{
  PImage img;
  
  
  Player(float x, float y){
    img = loadImage("bub.png");
    xPos = x; 
    yPos = y;
  }
  
  void display(){
    image(img, xPos, yPos, 100, 100);
  }
}

void setup(){
  size(600,600);
}

void keyPressed(){
  if (key == 'w'){
    print("lol");
      xPos += 100;
    }
}


void draw(){
  Player p = new Player(50,50);
  p.display();
}
