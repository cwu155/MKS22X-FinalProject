public static ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

boolean dir; //true = right, false = left

class Bubble implements Displayable, Moveable{
  float posX, posY, speed = 1;

  Bubble(float x, float y, boolean b){
    posX = x;
    posY = y;
    dir = b;
  }

  void display(){
    fill(0,255,0);
    ellipse(posX,posY,25,25);
  }

  void move(){
    //if within length of map, moves left or right
    if(posX < width-30-12.5 && posX > 30+12.5){
      if(dir){
        posX += speed;
      }else{
        posX -= speed;
      }
    }else{
      //else move up
      if(posY<50){
        posY += 500;
      }else{
        posY += -1*speed;
      }
    }
  }
 

  //void keyPressed(){
  //  move();
  //}
}

//Spawns a bubble, this is outside the Bubble class btw!!
 void spawn(){
   if(a.getX()<42.5 && !(a.getDir())){ //on the left & bub is facing left
     bubbles.add(new Bubble(30+12.5,a.getY(),a.getDir()));
   }else if(a.getX() > width-30-50 && (a.getDir())){ //on the right & bub facing left
     bubbles.add(new Bubble(width-30-12.5,a.getY(),a.getDir()));
   }else if(dir){ //facing right
      bubbles.add(new Bubble(a.getX()+50,a.getY()+25,a.getDir()));
   }else{ //facing left
     bubbles.add(new Bubble(a.getX()-50,a.getY()+25,a.getDir()));
   }
  }
    
