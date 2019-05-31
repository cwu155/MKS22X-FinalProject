public static ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

class Bubble implements Collideable{
  float posX, posY, speed;

Bubble(float x, float y, float s){
    posX = x;
    posY = y;
    speed = s;
}


  void display(){
    fill(0,255,0);
    ellipse(posX,posY,25,25);
  }

  void move(){
    //if within length of map, moves left or right
    if(posX < width-30-12.5 && posX > 30+12.5){
      posX += speed;
    }else{
      //else move up
      posY -= abs(speed);
    }
  }
  
  boolean touching(){
    for(Enemy e: enemies) {
            if(this.posX + 25 > e.getX() &&
               this.posY + 25 > e.getY() &&
               this.posX - 25 < e.getX() + 50 &&
               this.posY - 25 < e.getY() + 50) {
                e.hitEnemy();
                return true;
            }
        }
        return false;  
  }
      //if(posY<50+12.5){
      //  posY += 500;
      //}else{
      //  posY += -1*speed;
      //}
  }

//Spawns a bubble, this is outside the Bubble class btw!!
//Sets speed to 3
 void spawn(){
   if (right){
    bubbles.add(new Bubble(a.getX()+50,a.getY()+25, 3));
   } else {
    bubbles.add(new Bubble(a.getX()-50,a.getY()+25,-3));
   }
  }
