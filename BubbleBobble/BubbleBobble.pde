PImage bub;
Game g;
Player a;
Bubble b;
ArrayList<Displayable> displayMe;
ArrayList<Moveable> moveMe;
ArrayList<Collideable> coll;

void keyPressed(){
  if (keyCode == RIGHT){ //move right
    speedX = 10;
    if(posX<=915){ // 1000-60-25 (half of bub)
      posX += speedX;
    }
  }
  if (keyCode == LEFT){ //move leftt
    speedX = -10;
    if(posX>=40){
      posX += speedX;
    }
  }
  if (keyCode == UP){ //trigger jump
    reachedMax = false;
    up = true;
  }
  if(key == 'B' || key == 'b'){
    b = new Bubble(a.getX()+50,a.getY()+25);
    b.move();
  }
}
void setup(){
  size(1000,600);
  background(255);
  bub = loadImage("Images/bubblun.png");
  g = new Game();
  a = new Player(30,height-50-20);
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