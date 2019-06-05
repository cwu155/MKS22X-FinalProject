boolean running;
int level = 0;
class Game implements Displayable{
  int count = 0;

  Game(){
    running = true;
  }
  
  void display(){
    if(!running){
      count++;
      if(count > 900){ //ends after 900 frames which is ~15s
        System.exit(0);
      }
    }
    
    background(255,192,203);
    fill(0,0,0);
    rect(30,50,width-60,height-70);
    //rect(width/2-25,0,50,50);
    fill(255,192,203);
    noStroke();

    if(enemies.size() == 0 && items.size() == 0){
     /* if(level<2){
        level++;
      }else{*/
        running = false;
        level += 1;
        fill((int)random(256),(int)random(256),(int)random(256));
        textSize(50);
        text("You win!",width/2,150);
     // }
    }
    if(lives<=0){
      running = false;
      fill(255,0,0);
      textSize(50);
      text("You lose!",width/2,150);
    }
  }

  int getTime(){
    return frameCount/60;
  }

}
