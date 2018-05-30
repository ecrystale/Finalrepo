public class Fruit{
  float x,y;
  PImage img;
  String[] fruits= {"-10_Bomb.png", "Banana.png", "Bomb.png",
                    "Cherry.png", "Coconut.png", "Dragonfruit.png",
                    "Freeze_Banana.png", "Frenzy_Banana.png", "Green_Apple.png",
                    "Kiwi_Fruit.png", "Lemon.png", "Lime.png",
                    "Mango.png", "Orange.png", "Passionfruit.png",
                    "Pear.png", "Pinapple.png", "Plum.png",
                    "Pomegranate.png", "Red_Apple.png", "Score_2x_Banana.png",
                    "Strawberry.png", "Watermelon.png"};
  public Fruit(){
    int place=(int)random(65);
    String ok=fruits[place%21];
    img=loadImage(ok);
    x=random(width); 
    y=0;
 }
}