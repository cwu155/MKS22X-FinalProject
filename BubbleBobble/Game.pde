class Game implements Displayable{
  int level, count=0;
  boolean running;

  Game(){
    level = 1;
    running = true;
  }

  Game (int i){
    level = i;
    running = true;
  }

  void display(){
    //println(enemies.size());

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

      

    //  Enemy e1 = new Enemy(width/2,60,ene); enemies.add(e1);
     // Enemy e2 = new Enemy(width/2,300,ene); enemies.add(e2);

      if((enemies.size() == 0 && items.size() == 0) || lives <= 0){
        running = false;
      }
      //left rectangles
      //rect(30,250,100,20);
      //rect(30,350,100,20);
      //rect(30,450,100,20);
      //right rectangles
      //rect(width-30-100,250,100,20);
      //rect(width-30-100,350,100,20);
      //rect(width-30-100,450,100,20);
      //middle rectangles
      //rect(180,250,640,20);
      //rect(180,350,640,20);
      //rect(180,450,640,20);
    }
  }


  int getTime(){
    return frameCount/60;
  }

}
