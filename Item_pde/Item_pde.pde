PImage bub;
Game g;
Player a;
Bubble b;
void setup(){ 
  size(1000,600);
  background(255);
  bub = loadImage("bubblun.png");
  g = new Game();
  a = new Player("name",bub);
  b = new Bubble(a.posX+50,a.posY+25);
}

void draw(){
  g.display();
  a.display();
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