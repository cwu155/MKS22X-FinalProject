public static ArrayList<Platform> platforms = new ArrayList<Platform>();

class Platform implements Displayable{
  float posX, posY, pWidth, pHeight;
  
  Platform(float a, float b, float c, float d){
    posX = a;
    posY = b;
    pWidth = c;
    pHeight = d;
  }
  
  void display(){
    fill(255,192,203);
    noStroke();    
    rect(posX, posY, pWidth, pHeight);
  }
    
  }
 
    
