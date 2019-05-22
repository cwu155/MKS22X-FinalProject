PImage bub;
Game g;
Player a;
Bubble b;
ArrayList<Displayable> displayMe;
ArrayList<Moveable> moveMe;
ArrayList<Collideable> coll;

void keyPressed(){
    if (keyCode == RIGHT){ //move right
      speedX = 20;
      posX += speedX;
    }
    if (keyCode == LEFT){ //move left
      speedX = -20;
      posX += speedX;
    }
    if (keyCode == UP){ //trigger jump
      reachedMax = false;
      up = true;
    }
 }
void setup(){
  size(1000,600);
  background(255);
  bub = loadImage("bubblun.png");
  g = new Game();
  a = new Player(800,500);
  b = new Bubble(a.getX()+50,a.getY()+25);
}

void draw(){
  g.display();
  a.display();
  a.move();
  b.display();
  b.move();
  //level + score
  fill(0,0,0);
  textSize(25);
  textAlign(LEFT);
  text("Level: "+g.level,30,35);
  textAlign(RIGHT);
  text("Score: "+a.score,width-30,35);
}

interface Displayable{
  void display();
}

interface Moveable{
  void move();
}

interface Collideable{
  boolean touching();
} 
