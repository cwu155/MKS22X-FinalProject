public static ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

class Bubble implements Collideable {
  PImage bubble;
  float posX, posY, speed;
  boolean show;

Bubble(float x, float y, float s){
    posX = x;
    posY = y;
    speed = s;
    show = true;
}

 float getX(){
   return posX;
 }
 
 float getY(){
   return posY;
 }

  void display(){ 
    if(show){
      fill(0,255,0);
      ellipse(posX,posY,25,25); 
    } 
  }

  void move(){
    if (show){
      if(running){
        touching();
        //if within length of map, moves left or right
        if(posX < width-30-12.5 && posX > 30+12.5){
          posX += speed;
        }else{
          //else move up
          posY -= abs(speed);
        }
      }
  }
  }
  
  
  boolean touching(){
   for(Enemy e: enemies){
     e.changeHit(false);
     if(this.posX + 25 > e.getX() &&
        this.posY + 25 > e.getY() &&
        this.posX - 25 < e.getX() + 50 &&
        this.posY - 25 < e.getY() + 50){
        e.changeHit(true);
        e.hitEnemy();
        show = false;
        return true;
       }
    }
    return false;  
  }
 }

//Spawns a bubble, this is outside the Bubble class btw!!
//Sets speed to 3
 void spawn(){
   if (a.getDir()){
     if(a.getX()>900){
       bubbles.add(new Bubble(950,a.getY()+25, 3));
     }else{
      bubbles.add(new Bubble(a.getX()+50,a.getY()+25, 3));
     }
   } else {
     if(a.getX()<50){
       bubbles.add(new Bubble(50,a.getY(),-3));
     }else{
      bubbles.add(new Bubble(a.getX()-50,a.getY()+25,-3));
     }
   }
  }
