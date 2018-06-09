long time=System.currentTimeMillis();
long displayTime;
float fadeOutTime = 1000;
int initTime=60;
ArrayList <PVector> points = new ArrayList <PVector> ();
 PImage img;
 int score;
 ArrayList<Fruit> fruits = new ArrayList<Fruit>();
void setup() {
  size(640, 480);
  noStroke();
  img=loadImage("background.jpg");
  frameRate(100);
  score=0;
  //generate();
}
 
 void generate(){
   for (int i = 0; i < (int)random(4)+1; i++) {
    fruits.add(new Fruit());
  }
 }
 boolean end=false;
 boolean freeze=false;
 int timing;
void draw() {
  if(end==false){
  time=System.currentTimeMillis()/10;
  if(time%200==0.0){
    generate();
  }

  background(img);
    textSize(40);
  fill(#FFFFFF);
  text(""+score, 20, 50);
  textSize(40);
  fill(#FFFFFF);
  if(freeze==false){
  displayTime=initTime-(((int)millis()/1000)-2);
   }
  text(""+displayTime, 560, 50);
  
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
         if(f.ended()==true){
           end=true;
           clear();
          img=loadImage("End.png");
          image(img,0,0,width,height);        
          text("Score: "+score, width/2, height*3/4);
        }
        /**if(f.isfrozen() && freeze==false){
          freeze=true;
          timing= millis();
        }*/
        if(freeze==true){
          if(f.isfrozen()==false){
            f.setfreeze(true);
          }
          if(millis()-timing>=5000){
            initTime+=5;
            freeze=false;
            f.setfreeze(false);
          }
        }
  }
  if (displayTime<1){
  end=true;
    clear();
          img=loadImage("End.png");
          image(img,0,0,width,height);   
          textSize(40);
  fill(#FFFFFF);
          text("Score: "+score, width/2, height*3/4);
  }
}
}
 
void mouseDragged() {
  points.add(new PVector(mouseX, mouseY, millis()));
  for (Fruit f : fruits) {
    if(f.killed()!=true){
      if(f.killing()){
        f.kill();
        if(f.ended()==false){
        score++;
        }
        if(f.isfrozen() && freeze==false){
         freeze=true; 
         timing= millis();
        }
      }
    }
  }
}
