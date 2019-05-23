public static ArrayList<Platform> platforms = new ArrayList<Platform>();

class Platform implements Displayable{
  float posX, posY, pWidth, pHeight;
  
  Platform(float a, float b, float c, float d){
    posX = a;
    posY = b;
    pWidth = c;
    pHeight = d;
  }
  
  //Accessor methods
  float getX(){
    return posX;
  }
  
  float getY(){
    return posY;
  }
  
  float getWidth(){
    return pWidth;
  }
  
  float getHeight(){
    return pHeight;
  }
  
  //Displays the platform as a rectangle (individual platforms are created in Game class)
  void display(){
    fill(255,192,203);
    noStroke();    
    rect(posX, posY, pWidth, pHeight);
  }
    
  }
 
    
