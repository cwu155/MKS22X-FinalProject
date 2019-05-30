public static ArrayList<Item> items = new ArrayList<Item>();
public static int[] values = {10,10,10,10,10,10,10,10,10,10,50,50,50,50,50,100,100,100,250,250,500,500,1000};
boolean itemHit;
class Item implements Displayable{
  int posX, posY, points;

  Item(int x, int y, int p){
    posX = x;
    posY = y;
    points = p;
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
      }else{
        image(frenchfries,posX,posY);
      }
    }
  }
  
  void hitItem(){
    a.addPoints(points);
    items.remove(this);
    itemHit = true;
  }
  
  int getX(){
    return posX;
  }
  
  int getY(){
    return posY;
  }
}