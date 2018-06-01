ArrayList<Mover> movers;
float fadeOutTime = 1000;
ArrayList <PVector> points = new ArrayList <PVector> ();
 PImage img;
void setup() {
  size(640, 480);
  noStroke();
  img=loadImage("background.jpg");
  frameRate(100);
  movers = new ArrayList<Mover>();
  for (int i = 0; i < 10; i++) {
    movers.add(new Mover());
  }
}
 
void draw() {
  background(img);
  for (int i=points.size()-1; i>=0; i--) {
    PVector p = points.get(i);
    float timeAlive = millis() - p.z;
    if (timeAlive > fadeOutTime) {
      points.remove(i);
    } else {
      float transparency = map(timeAlive, 0, fadeOutTime, 255, 0);
      fill(255, transparency);
      ellipse(p.x, p.y, 7, 7);
    }
  }
    for (Mover m : movers) {
    m.display();
    m.update(movers);
  }
}
 
void mouseDragged() {
  points.add(new PVector(mouseX, mouseY, millis()));
}
