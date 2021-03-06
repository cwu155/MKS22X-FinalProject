Game g;
Player a;
Bubble b;
PImage bub;
PImage radish, corn, friedegg, orange, watermelon, frenchfries, extend;
boolean menu = true;
int bubbleCount = 0;

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
    
    //Corresponds different levels to number keys, basically hard code for the levels
    if(key == '1'){
      level = "1";
      menu = false;
      enemies.clear();
      bubbles.clear();
      platforms.clear();
      items.clear();
      a.removePoints();
      
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
      level = "2";
      menu = false;
      enemies.clear();
      bubbles.clear();
      platforms.clear();
      items.clear();
      a.removePoints();
      
      Enemy e1 = new Enemy(width/2-100,150); enemies.add(e1);
      Enemy e2 = new Enemy(width/2+100,150); enemies.add(e2);
      Enemy e3 = new Enemy(width/2-200,350); enemies.add(e3);
      Enemy e4 = new Enemy(width/2+200,450); enemies.add(e4);
      Enemy e5 = new Enemy(width/2,450); enemies.add(e5);
      
     //top to bottom, left to right rectangles
      Platform a = new Platform(width/2-100,150,200,20); platforms.add(a);
      Platform b = new Platform(width/2-250,250,200,20); platforms.add(b);
      Platform c = new Platform(width/2+100,250,200,20); platforms.add(c);
      Platform d = new Platform(width/2-350,350,700,20); platforms.add(d);
      Platform e = new Platform(width/2-400,450,200,20); platforms.add(e);
      Platform f = new Platform(width/2-100,450,200,20); platforms.add(f);
      Platform g = new Platform(width/2+200,450,200,20); platforms.add(g);
    }
    
    if(key == '3'){
      level = "3";
      menu = false;
      enemies.clear();
      bubbles.clear();
      platforms.clear();
      items.clear();
      a.removePoints();
      Enemy e1 = new Enemy(width/2-100,150); enemies.add(e1);
      Enemy e2 = new Enemy(width/2-100,240); enemies.add(e2);
      Enemy e3 = new Enemy(width/2+100,240); enemies.add(e3);
      Enemy e4 = new Enemy(width/2-200,350); enemies.add(e4);
      Enemy e5 = new Enemy(width/2+200,350); enemies.add(e5);
      Enemy e6 = new Enemy(width/2-100,450); enemies.add(e6);
      Enemy e7 = new Enemy(width/2+100,450); enemies.add(e7);
      
     //top to bottom, left to right rectangles
      Platform a = new Platform(100,150,300,20); platforms.add(a);
      Platform b = new Platform(600,150,300,20); platforms.add(b); 
      
      //these are the long platforms that would form the E in the original lv3, but theres no code for when bub touches them
     // Platform c = new Platform(100,150,20,200); platforms.add(c);
     // Platform d = new Platform(880,150,20,200); platforms.add(d);
      Platform e = new Platform(100,240,220,20); platforms.add(e);
      Platform f = new Platform(1000-320,240,220,20); platforms.add(f);
      Platform g = new Platform(100,330,350,20); platforms.add(g);
      Platform h = new Platform(1000-350-100,330,350,20); platforms.add(h);
      Platform i = new Platform(100,450,250,20); platforms.add(i);
      Platform j = new Platform(1000-250-100,450,250,20); platforms.add(j);
      Platform k = new Platform(width/2-50,450,100,20); platforms.add(k);
      
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
  extend = loadImage("../BubbleBobble/Images/extend.png");
  radish.resize(50,50);
  corn.resize(50,50);
  friedegg.resize(50,50);
  orange.resize(50,50);
  watermelon.resize(50,50);
  frenchfries.resize(50,50);
  extend.resize(50,50);
  g = new Game();
  a = new Player(30,height-50-20);
  Enemy e1 = new Enemy(width/2,60); enemies.add(e1);
  Platform a = new Platform(width/2-100,height/2,200,20); platforms.add(a);
}

void draw(){
  //Shows everything on the screen (Player, enemies, bubbles, platforms, etc...)
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
  }
  for (Enemy e : enemies){
     e.display(); 
     e.move();
  }
  for(Item i : items){
    i.display();
  }
  
  //Displays "menu" at the beginning
  if(menu){
    level = "MENU";
    fill(255,192,203);
    textAlign(CENTER);
    textSize(25);
    text("Welcome to Bubble Bobble!",width/2,height/2-60);
    textSize(15);
    text("To play, press the spacebar to blow a bubble and the arrow keys to move your dragon",width/2,height/2+60);
    text("Use the number keys to switch between levels",width/2,height/2+100);
    text("Your objective is to hit the enemies with the bubbles and collect the food items left behind for points",width/2,height/2+140);
    text("You only have 3 lives. Have fun!",width/2,height/2+180);
  }
  
  //Displays time and score.
  fill(0,0,0);
  textSize(25);
  textAlign(LEFT);
  text("Score: "+a.score,30,35);
  textAlign(RIGHT);
  text("Level: "+level,width-30,35);
  textAlign(CENTER);
  text("Time: "+g.getTime(),width/2,35);

  //Displays the number of lives
  int holder = 40;
  fill(255,0,0);
  for (int i = 0; i < lives; i++){
    rect(holder,60,20,20);
    holder += 25;
  }
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
