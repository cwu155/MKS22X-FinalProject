Game g;
Player a;
Bubble b;
PImage bub, ene;
PImage radish, corn, friedegg, orange, watermelon, frenchfries;
ArrayList<Displayable> displayMe;
ArrayList<Moveable> moveMe;
ArrayList<Collideable> coll;

void keyPressed(){
  if (keyCode == RIGHT){ //move right
    speedX = 15;
    if(posX <= 915){ // 1000-60-25 (half of bub)
      posX += speedX;
    }
    img = loadImage("Images/bubblun.png");
    right = true;
    left = false;
  }
  
  if (keyCode == LEFT){ //move left
    speedX = -15;
    if(posX >= 40){
      posX += speedX;
    }
    img = loadImage("../BubbleBobble/Images/bubblunReverse.png");
    right = false;
    left = true;
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
    case 37:
      left = false;
    
    case 38://up
      up = false;
      
    case 39:
      right = false;
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
  if(g.level == 1){
      Enemy e1 = new Enemy(width/2,60,ene); enemies.add(e1);
     // Enemy e2 = new Enemy(width/2,250,ene); enemies.add(e2);
    //  Enemy e3 = new Enemy(width/2,450,ene); enemies.add(e3);
    
      //left rectangles
      Platform a = new Platform(30,250,100,20); platforms.add(a);
      Platform b = new Platform(30,350,100,20); platforms.add(b);
      Platform c = new Platform(30,450,100,20); platforms.add(c);

      //right rectangles
      Platform d = new Platform(width-30-100,250,100,20); platforms.add(d);
      Platform e = new Platform(width-30-100,350,100,20); platforms.add(e);
      Platform f = new Platform(width-30-100,450,100,20); platforms.add(f);

      //middle rectangles
      Platform g = new Platform(200,250,600,20); platforms.add(g);
      Platform h = new Platform(200,350,600,20); platforms.add(h);
      Platform i = new Platform(200,450,600,20); platforms.add(i);
  }
  if(g.level == 2){
    Enemy e1 = new Enemy(width/2,60,ene); enemies.add(e1);
    Enemy e2 = new Enemy(width/2,250,ene); enemies.add(e2);
    Enemy e3 = new Enemy(width/2,450,ene); enemies.add(e3);
   //left rectangles
    Platform a = new Platform(30,250,100,20); platforms.add(a);
    Platform b = new Platform(30,350,100,20); platforms.add(b);
    Platform c = new Platform(30,450,100,20); platforms.add(c);

    //right rectangles
    Platform d = new Platform(width-30-100,250,100,20); platforms.add(d);
    Platform e = new Platform(width-30-100,350,100,20); platforms.add(e);
    Platform f = new Platform(width-30-100,450,100,20); platforms.add(f);

    //middle rectangles
    Platform g = new Platform(200,250,600,20); platforms.add(g);
    Platform h = new Platform(200,350,600,20); platforms.add(h);
    Platform i = new Platform(200,450,600,20); platforms.add(i);
  }
}

void draw(){
  g.display();
  for(Platform p : platforms){
    p.display();
  }
  a.display();
  a.move();
  a.touching();
  a.touchingE();
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
  text("Time: "+g.getTime(),width/2,35);
  fill(255,0,0); //fill all 3 as red
  rect(40,60,20,20); //then fill red boxes as black when a life is lost
  rect(65,60,20,20);
  rect(90,60,20,20);
  if(lives==2){
    fill(0,0,0);
    rect(90,60,20,20);
 //   a.setXY(30,height-50-20);
  }
  if(lives==1){
    fill(0,0,0);
    rect(65,60,20,20);
    rect(90,60,20,20);
  //  a.setXY(30,height-50-20);
  }
  if(lives<=0){
    fill(0,0,0);
    rect(40,60,20,20);
    rect(65,60,20,20);
    rect(90,60,20,20);
 //   a.setXY(30,height-50-20);
  }
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
