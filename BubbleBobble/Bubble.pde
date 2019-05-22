class Bubble implements Displayable, Moveable{
  float posX, posY, speed = 1;
  
  Bubble(float x, float y){
    posX = x;
    posY = y;
  }
  
  void display(){
    fill(0,255,0);
    ellipse(posX,posY,25,25);
  }
  
  void move(){
    //if within length of map, moves left or right
    if(posX < width-30-25 && posX > 30){
      posX += speed;
    }else{
      //else move up
      posY += -1*speed;
    }
  }
}
