class Game implements Displayable{
  int level, count=0;
  boolean running;

  Game(){
    level = 1;
    running = true;
  }

  Game(int i){
    level = i;
    running = true;
  }

  void display(){

    if(!running){
      count++;
      if(count > 900){ //ends after 900 frames which is ~15s
        System.exit(0);
      }
    }
    if(level == 1){
      background(255,192,203);
      fill(0,0,0);
      rect(30,50,width-60,height-70);
      //rect(width/2-25,0,50,50);
      fill(255,192,203);
      noStroke();

      if((enemies.size() == 0 && items.size() == 0) || lives <= 0){
        running = false;
      }
    }
  }

  int getTime(){
    return frameCount/60;
  }

}
