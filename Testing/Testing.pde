void setup(){
  size(600,600);
  posX = 100; 
  posY = 500;
  up = false;
}

void draw(){
  background(0);
  Player p = new Player(posX, posY);
  p.display();
  p.jump();
}

void keyPressed(){
    if (key == 'd'){ //move right
      speedX = 20;
      posX += speedX;
    }
    if (key == 'a'){ //move left
      speedX = -20;
      posX += speedX;
    }  
    if (key == 'w'){ //trigger jump
      reachedMax = false;
      up = true;
    }
 }
