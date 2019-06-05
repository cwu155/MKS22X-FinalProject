public static ArrayList<Item> items = new ArrayList<Item>();
public static int[] pointVals = {1,10,10,10,10,10,10,10,10,10,10,50,50,50,50,50,100,100,100,250,250,500,500,1000};

class Item implements Displayable{
  int posX, posY, points;
  boolean itemHit;

  Item(int x, int y, int p){
    posX = x;
    posY = y;
    points = p;
    itemHit = false;
  }

  void display(){ //points determine the picture that will be displayed
    if(!itemHit){
      if(points == 10){
        image(radish,posX,posY);
      }else if(points == 50){
        image(corn,posX,posY);
      }else if(points == 100){
        image(friedegg,posX,posY);
      }else if(points == 250){
        image(orange,posX,posY);
      }else if(points == 500){
        image(watermelon,posX,posY);
      }else if(points == 1000){
        image(frenchfries,posX,posY);
      }else{
        image(extend,posX,posY);
      }
    }
  }
  
  void hitItem(){
    if(getPoints() == 1){
      lives += 1;
    } else {
      a.addPoints(points);
    }
    items.remove(this);
    itemHit = true;
  }
  
  int getX(){
    return posX;
  }
  
  int getY(){
    return posY;
  }
  
  int getPoints(){
    return points;
  }
}
