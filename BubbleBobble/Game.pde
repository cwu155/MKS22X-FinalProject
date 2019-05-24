class Game implements Displayable{
  int level;
  float time;
  boolean running;

  Game(){
    level = 0;
    running = true;
    time = millis()/1000;
  }

  Game (int i){
    level = i;
    running = true;
    time = millis()/1000;
  }

  void display(){
    if(level == 0){
      background(255,192,203);
      fill(0,0,0);
      rect(30,50,width-60,height-70);
      fill(255,192,203);
      noStroke();
      //left rectangles
      rect(30,250,100,20);
      rect(30,350,100,20);
      rect(30,450,100,20);
      //right rectangles
      rect(width-30-100,250,100,20);
      rect(width-30-100,350,100,20);
      rect(width-30-100,450,100,20);
      //middle rectangles
      rect(180,250,640,20);
      rect(180,350,640,20);
      rect(180,450,640,20);
    }
  }

}