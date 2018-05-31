ArrayList<Fruit> fruits;
float fadeOutTime = 1000;
ArrayList <PVector> points = new ArrayList <PVector> ();
 PImage img;
void setup() {
  size(640, 480);
  noStroke();
  img=loadImage("background.jpg");
  frameRate(100);
  fruits = new ArrayList<Fruit>();
  for (int i = 0; i < 10; i++) {
    fruits.add(new Fruit());
  }
}
 
void draw() {
  background(img);
 for (Fruit f : fruits) {
    f.display();
    //image(f.(img), 0, 0);
  }
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
}
 
void mouseDragged() {
  points.add(new PVector(mouseX, mouseY, millis()));
}
