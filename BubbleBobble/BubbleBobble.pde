Game g;
Player a;
Bubble b;
PImage bub;
PImage radish, corn, friedegg, orange, watermelon, frenchfries;
boolean menu = true;
int bubbleCount=0;

void keyPressed(){
  if(running){
    if (keyCode == RIGHT){ //move right
      speedX = 15;
      if(posX <= 915){ // 1000-60-25 (half of bub)
        posX += speedX;
      }
      img = loadImage("../BubbleBobble/Images/bubblun.png");
      right = true;
      left = false;
      a.changeDir(true);
    }
    
    if (keyCode == LEFT){ //move left
      speedX = -15;
      if(posX >= 40){
        posX += speedX;
      }
      img = loadImage("../BubbleBobble/Images/bubblunReverse.png");
      right = false;
      left = true;
      a.changeDir(false);
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
    
    if(key == '1'){
      menu = false;
      enemies.clear();
      bubbles.clear();
      platforms.clear();
      items.clear();
      Enemy e1 = new Enemy(width/2,60); enemies.add(e1);
      Enemy e2 = new Enemy(width/2,60); enemies.add(e2);
      Enemy e3 = new Enemy(width/2,60); enemies.add(e3);
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
    if(key == '2'){
      menu = false;
      enemies.clear();
      bubbles.clear();
      platforms.clear();
      items.clear();
      Enemy e1 = new Enemy(width/2,60); enemies.add(e1);
      Enemy e2 = new Enemy(width/2,250); enemies.add(e2);
      Enemy e3 = new Enemy(width/2,450); enemies.add(e3);
     //left rectangles
      Platform a = new Platform(30,250,100,20); platforms.add(a);
      Platform b = new Platform(30,350,100,20); platforms.add(b);
      Platform c = new Platform(30,450,100,20); platforms.add(c);
  
      //right rectangles
      Platform d = new Platform(width-30-150,250,100,20); platforms.add(d);
      Platform e = new Platform(width-30-100,350,100,20); platforms.add(e);
      Platform f = new Platform(width-30-100,450,100,20); platforms.add(f);
  
      //middle rectangles
      Platform g = new Platform(200,250,600,20); platforms.add(g);
      Platform h = new Platform(200,350,600,20); platforms.add(h);
      Platform i = new Platform(200,450,600,20); platforms.add(i);
    }
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
  radish = loadImage("../BubbleBobble/Images/radish.png");
  corn = loadImage("../BubbleBobble/Images/corn.png");
  friedegg = loadImage("../BubbleBobble/Images/egg.png");
  orange = loadImage("../BubbleBobble/Images/orange.png");
  watermelon = loadImage("../BubbleBobble/Images/watermelon.png");
  frenchfries = loadImage("../BubbleBobble/Images/fries.png");
  radish.resize(50,50);
  corn.resize(50,50);
  friedegg.resize(50,50);
  orange.resize(50,50);
  watermelon.resize(50,50);
  frenchfries.resize(50,50);
  g = new Game();
  a = new Player(30,height-50-20);
  Enemy e1 = new Enemy(width/2,60); enemies.add(e1);
  Platform a = new Platform(width/2-100,height/2,200,20); platforms.add(a);
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
     //b.touching();
  }
  for (Enemy e : enemies){
     e.display(); 
     e.move();
  }
  for(Item i : items){
    i.display();
  }
  if(menu){
    fill(255,192,203);
    textSize(25);
    text("Welcome to Bubble Bobble!",width/2,height/2-60);
    textSize(15);
    text("To play, press the spacebar to blow a bubble and the arrow keys to move your dragon",width/2,height/2+60);
    text("Use the number keys to switch between levels",width/2,height/2+100);
    text("Your objective is to hit the enemies with the bubbles and collect the food items left behind for points",width/2,height/2+140);
    text("You only have 3 lives. Have fun!",width/2,height/2+180);
  }
  fill(0,0,0);
  textSize(25);
  textAlign(LEFT);
  text("Score: "+a.score,30,35);
  /*textAlign(RIGHT);
  text("Level: "+g.level,width-30,35);*/
  textAlign(CENTER);
  text("Time: "+g.getTime(),width/2,35);
  fill(255,0,0);
  rect(40,60,20,20);
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
