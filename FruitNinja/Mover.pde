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
    xspeed= random(1)+.5;
    yspeed= -1;
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
    private boolean mid=false;
    public void update(ArrayList<Mover> others) {
    if(mid==false){
       if(x>(width/2)){
         x -= xspeed;
         if(x==width/2){
            mid=true; 
         }
       }  
       if(x<(width/2)){
         x += xspeed;
         if(x==width/2){
           mid=true;
           xspeed=-xspeed;
         } 
       }
       if(x==width/2){
            mid=true; 
        }
    }
    if(mid==true){
       x+=xspeed;
    }
    if(y>height/4){
        y += yspeed;
    }
    if(y==height/4){
       hit=true;
       yspeed=1;
    }
    if(hit==true){
       //yspeed=-1;
       y+=yspeed; 
    }
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
