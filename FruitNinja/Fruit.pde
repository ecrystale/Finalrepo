public class Fruit{
  float x, xspeed, xacc;
  float y, yspeed, yacc;;
  PImage img;
  boolean frozenBanana;
  long time=System.currentTimeMillis();
  String[] fruits= {"Banana.png", "Coconut.png", "Dragonfruit.png",
                    "Freeze_Banana.png", "Frenzy_Banana.png","Green_Apple.png",
                    "Kiwi_Fruit.png", "Lemon.png","Lime.png", 
                    "Mango.png", "Orange.png", "Passionfruit.png", 
                    "Pear.png", "Pineapple.png","Plum.png",
                    "Pomegranate.png", "Red_Apple.png","Score_2x_Banana.png", 
                    "Strawberry.png", "Watermelon.png","-10_Bomb.png", 
                    "Bomb.png"};
                    
  String imaged="";
  public Fruit(){
    int place=(int)random(22);
    imaged=fruits[place];
    img=loadImage(imaged);
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
    boolean move=true;
    //private boolean mid=false;
     public void update(ArrayList<Fruit> others) {
       if(move==true){
    //change the position etc.
    x += xspeed; 
    y += yspeed; 
    yspeed += yacc;
    xspeed += xacc;
       }
     }
    boolean killedx=false;;
    public boolean killed(){
      return killedx;
    }
    public boolean killing(){
       return (withinWidth(mouseX) && withinLength(mouseY));
    }
    public boolean withinWidth(int xplace){
      if(xplace<= x+25 && xplace>=x-25){
          killedx=true;
         return true; 
      }
      return false;
    }
   public boolean withinLength(int yplace){
      if(yplace<= y+30 && yplace>=y-30){
         return true; 
      }
      return false;
    }
    public void kill(){
      if(!(imaged.equals("-10_Bomb.png") || imaged.equals("Bomb.png"))){/**
      if(imaged.equals("Freeze_Banana.png") || imaged.equals("Frenzy_Banana.png")
         || imaged.equals("Score_2x_Banana.png")){
        imaged="Banana.png";
      }
      imaged=imaged.substring(0,imaged.length()-4)+"Slice.png";*/
      img=loadImage("stain.png");
      image(img,x,y,50,60);
      move=false;
    }
    }
 public void display(){
      image(img,x,y,50,60); 
 }
}