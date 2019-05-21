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