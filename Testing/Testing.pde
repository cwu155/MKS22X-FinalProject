float xPos, yPos;
 
 class Player{
  PImage img;
  
  Player(float x, float y){
    img = loadImage("bub.png");
    xPos = x;
    yPos = y;
  }
  
   void display(){
     image(img, xPos, yPos, 50, 50); 
     //ellipse(xPos,yPos,50,50);
   }
    
    
}


void setup(){
  size(600,600);
  xPos = 50; 
  yPos = 50;
}

void draw(){
  background(0);
  Player p = new Player(xPos, yPos);
  p.display();
  
  //ellipse(xPos,yPos,50,50);
}

void keyPressed(){
    if (key == 'd'){
      xPos += 5;
    }
    if (key == 'a'){
      xPos -= 5;
    }
    if (key == 'w'){
      yPos -= 5;
    }
    if (key == 's'){
      yPos += 5;
    }
 }
