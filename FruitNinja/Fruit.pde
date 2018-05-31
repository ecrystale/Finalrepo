public class Fruit{
  float x,y;
  PImage img;
  String[] fruits= {"Banana.png", "Cherry.png", "Coconut.png", 
                    "Dragonfruit.png", "Freeze_Banana.png", "Frenzy_Banana.png", 
                    "Green_Apple.png", "Kiwi_Fruit.png", "Lemon.png",
                    "Lime.png", "Mango.png", "Orange.png", 
                    "Passionfruit.png", "Pear.png", "Pineapple.png", 
                    "Plum.png", "Pomegranate.png", "Red_Apple.png", 
                    "Score_2x_Banana.png", "Strawberry.png", "Watermelon.png",
                    "-10_Bomb.png", "Bomb.png"};
  public Fruit(){
    String ok;
    int place=(int)random(23);
    /**if(place==45){
      ok=fruits[22];
    }
    if(place==46){
      ok=fruits[23];
    }
    else{*/
    ok=fruits[place];
    img=loadImage(ok);
    x = random(width);
    y = height-60;
 }
 public void display(){
      image(img,x,y,50,60); 
 }
}
