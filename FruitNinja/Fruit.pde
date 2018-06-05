public class Fruit{
  float x, xspeed, xacc;
  float y, yspeed, yacc;;
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

    ok=fruits[place];
    img=loadImage(ok);
    x = random(width);
    y = height-60;
    xspeed= random(1)+.1;
    xacc=-.01;
    yspeed= -2.5;
    yacc=.01;
    if(x>(width/2)){
         x = -xspeed;
         xacc=-xacc;
    }
    if(x==width/2){
         //mid=true; 
         xspeed=0;
     }  
    }
 
     private boolean hit=false; 
    private boolean top=false; 
    //private boolean mid=false;
     public void update(ArrayList<Fruit> others) {
    //change the position etc.
    x += xspeed; 
    y += yspeed; 
    yspeed += yacc;
    xspeed += xacc;}
 public void display(){
      image(img,x,y,50,60); 
 }
}
