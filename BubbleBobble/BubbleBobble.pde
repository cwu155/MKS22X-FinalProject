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
    img = loadImage("Images/bubblun.png");
    right = true;
  }
  if (keyCode == LEFT){ //move left
    speedX = -15;
    if(posX>=40){
      posX += speedX;
    }
    //img = loadImage("Images/bubblunReverse.png");
    right = false;
    img = loadImage("../BubbleBobble/Images/bubblunReverse.png");
  }
  if (keyCode == UP){ //trigger jump 
    touching = false;
    if (posY >= 50){
      up = true;
    }
   } 

  if(keyCode == 32){ //space
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
  bub = loadImage("Images/bubblun.png");
  ene = loadImage("Images/enemy1.gif");
  radish = loadImage("Images/radish.png");
  corn = loadImage("Images/corn.png");
  friedegg = loadImage("Images/egg.png");
  orange = loadImage("Images/orange.png");
  watermelon = loadImage("Images/watermelon.png");
  frenchfries = loadImage("Images/fries.png");
  radish.resize(50,50);
  corn.resize(50,50);
  friedegg.resize(50,50);
  orange.resize(50,50);
  watermelon.resize(50,50);
  frenchfries.resize(50,50);
  g = new Game();
  a = new Player(30,height-50-20);
  Enemy e1 = new Enemy(width/2,60,ene); enemies.add(e1);
}

void draw(){
  g.display();
  for(Platform p : platforms){
    p.display();
  }
  a.display();
  a.move();
  a.touching();
  for (Bubble b : bubbles){
     b.display(); 
     b.move();
     b.touching();
  }
  for (Enemy e : enemies){
     e.display(); 
     e.move();
  }
  for(Item i : items){
    i.display();
  }
  //level + score
  fill(0,0,0);
  textSize(25);
  textAlign(LEFT);
  text("Score: "+a.score,30,35);
  textAlign(RIGHT);
  text("Level: "+g.level,width-30,35);
  textAlign(CENTER);
  text("Time: "+g.getTime(),700,35);
  
  //Testing Purposes
  textSize(20);
  text("X: " + posX, 200, 35);
  text("Y: " + posY, 300, 35);
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
