ArrayList<Displayable> displayMe;
ArrayList<Moveable> moveMe;
ArrayList<Collideable> coll;
PImage bub;
PImage ene;
Game g;
Player p;
Bubble b;
Enemy e;
Item i;
void setup(){ 
  size(1000,600);
  background(255);
  bub = loadImage("bubblun.png");
  ene = loadImage("enemy1.gif");
  g = new Game();
  p = new Player("name",bub);
  b = new Bubble(a.posX+50,a.posY+25);
  e = new Enemy(width/2,50,ene);
  ArrayList<Displayable> displayMe;
  ArrayList<Moveable> moveMe;
  ArrayList<Collideable> coll;
}

void draw(){
  g.display();
  p.display();
  e.display();
  b.display();
  b.move();  
  e.move();
  p.move();
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
  void display();
}

interface Collideable{
  boolean touching();
}