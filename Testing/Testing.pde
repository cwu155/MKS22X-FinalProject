PImage bub;
PImage ene;
Game g;
Player a;
Bubble b;
PImage radish;
PImage corn;
PImage friedegg;
PImage orange;
PImage watermelon;
PImage frenchfries;
ArrayList<Displayable> displayMe;
ArrayList<Moveable> moveMe;
ArrayList<Collideable> coll;

void keyPressed(){
  if (keyCode == RIGHT){ //move right
    speedX = 15;
    if(posX<=915){ // 1000-60-25 (half of bub)
      posX += speedX;
    }
    img = loadImage("../BubbleBobble/Images/bubblun.png");
    right = true;
  }
  if (keyCode == LEFT){ //move left
    speedX = -15;
    if(posX>=40){
      posX += speedX;
    }
    img = loadImage("../BubbleBobble/Images/bubblunReverse.png");
    right = false;
    img = loadImage("../BubbleBobble/Images/bubblunReverse.png");
  }
  if (keyCode == UP){ //trigger jump 
    touching = false;
    if (posY >= 50){
      up = true;
    }
   } 

  if(key == 'B' || key == 'b'){
    spawn();
  }
}

void keyReleased(){
    switch (keyCode){
    case 38://up
      up = false;
    }
}

void setup(){
  size(1000,600);
  background(255);
  bub = loadImage("../BubbleBobble/Images/bubblun.png");
  ene = loadImage("../BubbleBobble/Images/enemy1.gif");
  radish = loadImage("../BubbleBobble/Images/radish.png");
  corn = loadImage("../BubbleBobble/Images/corn.png");
  friedegg = loadImage("../BubbleBobble/Images/egg.png");
  orange = loadImage("../BubbleBobble/Images/orange.png");
  watermelon = loadImage("../BubbleBobble/Images/watermelon.png");
  frenchfries = loadImage("../BubbleBobble/Images/fries.png");
  g = new Game();
  a = new Player(30,height-50-20);
}

void draw(){
  g.display();
  for(Platform p : platforms){p.display();}
  a.display();
  a.move();
  for (Bubble b : bubbles){
     b.display(); 
     b.move();
  }
  for (Enemy e : enemies){
     e.display(); 
     e.move();
  }
  //level + score
  fill(0,0,0);
  textSize(25);
  textAlign(LEFT);
  text("Level: "+g.level,30,35);
  textAlign(RIGHT);
  text("Score: "+a.score,width-30,35);
  textAlign(CENTER);
  text("Time: "+g.time,width/2,35);
  
  //Testing Purposes
  textSize(20);
  text("X: " + posX, 200, 35);
  text("Y: " + posY, 300, 35);
  text("SpeedY: " + speedY, 700, 35);
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
