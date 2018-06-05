long time=System.currentTimeMillis();
float fadeOutTime = 1000;
ArrayList <PVector> points = new ArrayList <PVector> ();
 PImage img;
 ArrayList<Fruit> fruits = new ArrayList<Fruit>();
void setup() {
  size(640, 480);
  noStroke();
  img=loadImage("background.jpg");
  frameRate(100);
  
  //generate();
}
 
 void generate(){
   for (int i = 0; i < (int)random(4)+1; i++) {
    fruits.add(new Fruit());
  }
 }
void draw() {
  time=System.currentTimeMillis()/10;
  if(time%200==0.0){
    generate();
  }

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
  for (Fruit f : fruits) {
    f.display();
    f.update(fruits);
  }
}
 
void mouseDragged() {
  points.add(new PVector(mouseX, mouseY, millis()));
  for (Fruit f : fruits) {
    if(f.killed()!=true){
      if(f.killing()){
        f.kill();
      }
    }
  }
}
