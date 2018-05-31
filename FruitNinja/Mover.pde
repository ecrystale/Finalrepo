public class Mover {
  float x, xspeed, xacc;
  float y, yspeed, yacc;
  float r;
  color c;

  public Mover() {
    x = random(width);
    y = height;
    r = 50;
    c = color(0, 255, 0);
    xspeed= -5;
    yspeed= -5;
  }

  public Mover(int a) {
    //x = random(width-2*r)+r;
    //y = random(height-2*r)+r;
     r = 20+random(20);
    c = color(0, 255, 0);
    xspeed= random(1)-.5;
    yspeed= 1;
  }

  public void update(ArrayList<Mover> others) {
    x += xspeed; 
    y += yspeed; 
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