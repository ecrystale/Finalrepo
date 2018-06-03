public class Mover {
  float x, xspeed, xacc;
  float y, yspeed, yacc;
  float r;
  color c;

  public Mover() {
    x = random(width);
    y = height-60;
    r = 50;
    c = color(0, 255, 0);
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
/**
  public Mover(int a) {
    x = random(width-2*r)+r;
    y = height+60;//random(height-2*r)+r;
     r = 20+random(20);
    c = color(0, 255, 0);
    xspeed= random(1)+.5;
    yspeed= 1;
  }*/
    private boolean hit=false; 
    private boolean top=false; 
    //private boolean mid=false;
     public void update(ArrayList<Mover> others) {
    //change the position etc.
    x += xspeed; 
    y += yspeed; 
    yspeed += yacc;
    xspeed += xacc;}
    /**
    public void update(ArrayList<Mover> others) {
    x+=xspeed;
    x+=xacc;
    if(top==false){
    if(y>height/8){
        y += yspeed;
    }
    if(y==height/4){
       //hit=!hit; 
       //if(hit==true){
         yspeed=-.5;
         yacc=-yacc;
      //
    }
    if(y==height/8){
       top=true;
       yspeed=.5;
       yacc=-yacc;
       //yspeed=-.5;
      }
    }
    if(top==true){
       //yspeed=-1
      if(y==height/4){
           yspeed=1;
      }
      y+=yspeed; 
    }  
    y+=yacc;
  }
  /**
  public void checkWalls() {
    if (x < r) {
      xspeed *= -1;
      x = r;//prevents 2 true in a row
    }
    if (x > width - r) {
      xspeed *= -1;
      x = width - r;//prevents 2 true in a row
    }
    if (y < r) {
      yspeed *= -.9;
      y = r;//prevents 2 true in a row
    }
    if (y > height - r) {
      yspeed *= -.9;
      y = height - r;//prevents 2 true in a row
    }
  }*/
  public void display() {
    fill(c);
    ellipse(x, y, r * 2, r * 2);
  }
}
