class Game implements Displayable{
  int level;
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
    if(level == 1){
      background(255,192,203);
      fill(0,0,0);
      rect(30,50,width-60,height-70);
      //rect(width/2-25,0,50,50);
      fill(255,192,203);
      noStroke();

      //Super ratchet code
      //left rectangles
      Platform a = new Platform(30,250,100,20); platforms.add(a);
      Platform b = new Platform(30,350,100,20); platforms.add(b);
      Platform c = new Platform(30,450,100,20); platforms.add(c);

      //right rectangles
      Platform d = new Platform(width-30-100,250,100,20); platforms.add(d);
      Platform e = new Platform(width-30-100,350,100,20); platforms.add(e);
      Platform f = new Platform(width-30-100,450,100,20); platforms.add(f);

      //middle rectangles
      Platform g = new Platform(200,250,600,20); platforms.add(g);
      Platform h = new Platform(200,350,600,20); platforms.add(h);
      Platform i = new Platform(200,450,600,20); platforms.add(i);

      Enemy e1 = new Enemy(width/2,60,ene); enemies.add(e1);
     // Enemy e2 = new Enemy(width/2,300,ene); enemies.add(e2);

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