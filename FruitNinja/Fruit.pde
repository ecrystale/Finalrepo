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
                    "Strawberry.png", "Watermelon.png", "Bomb.png"};
                    
  String imaged="";
  public Fruit(){
    int place=(int)random(21);
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
    boolean gameend=false;
    public boolean ended(){
     return gameend; 
    }
    public boolean isfrozen(){
      return frozenBanana;
    }
    public void kill(){
      if(imaged.equals("Bomb.png")){
        //img=loadImage("End.png");
        clear();
        //image(img);//,width,height,width,height);
        gameend=true;
        //move=false;
      }
      else{
      if(imaged.equals("Freeze_Banana.png")){
        frozenBanana=true;
      }
      img=loadImage("stain.png");
      image(img,x,y,50,60);
      move=false;
    }
  }
  float origxs,origxa;
  float origys,origya; 
  public void setfreeze(boolean ok){
     frozenBanana=ok;
     if(frozenBanana){
       xspeed= xspeed/4;
       xacc=xacc/4;
      yspeed= yspeed/2;
       yacc=yacc/3;
       if(x>(width/2)){
           x = -xspeed;
           xacc=-xacc;
      }
      if(x==width/2){
           //mid=true; 
           xspeed=0;
       } 
     }else
       {
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
  }
 public void display(){
      image(img,x,y,50,60); 
 }
}
