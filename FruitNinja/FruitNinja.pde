int time;//=System.currentTimeMillis();
long displayTime,timed;
float fadeOutTime = 1000;
int initTime=60;
boolean combo;
int combocount;
ArrayList <PVector> points = new ArrayList <PVector> ();
 PImage img;
 PImage logo;
 int score;
 ArrayList<Fruit> fruits = new ArrayList<Fruit>();
 
 PFont font;
void setup() {
  //generate();
  img=loadImage("background.jpg");
  //logo = loadImage("FruitNinja.png"); 
  //image(logo,30,50);
  
  background(img);
  size(640, 480);   
  font = createFont("Arial",116,true);
  textFont(font,50);
  fill(0);  
  text("Start",(width/2)-60, height/2);
  //if(){
  // startup(); 
  // started=true;
  //}
}

boolean started;

void startup(){
    size(640, 480);
    noStroke();
    img=loadImage("background.jpg");
    frameRate(100);
    score=0; 
  }
   
void generate(){
     for (int i = 0; i < (int)random(4)+1; i++) {
      fruits.add(new Fruit());
    }
   }
   
void Fgenerate(){
    for (int i = 0; i < (int)random(25)+7; i++) {
      Fruit f=new Fruit();
      if(f.thefruit()!="Bomb.png"){
        fruits.add(f);
      }
    }
   }
   
boolean end;
boolean freeze,doubled,frenzy;
int timing,timingd,timingf,addedtime;

void draw() {
    if(started==true){
    if(end==false){
      timed=System.currentTimeMillis()/10;
       if(timed%200==0.0){
        if(frenzy==true){
          Fgenerate();
          timingf--;
        if(timingf==0){
          frenzy=false; 
        }
      }
      else{
        generate(); 
      }
      
    }
  
    background(img);
      textSize(40);
    fill(#FFFFFF);
    text(""+score, 20, 50);
    textSize(40);
    fill(#FFFFFF);
    if(freeze==false){
    displayTime=((61000+addedtime-millis())/1000);
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
          if(freeze==true){
            if(f.isfrozen()==false){
              f.setfreeze(true);
            }
            if(millis()-timing>=5000){
              addedtime+=5000;
              freeze=false;
              //f.setfreeze(false);
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
}
   

 
void mouseDragged() {
  points.add(new PVector(mouseX, mouseY, millis()));
   combocount=0;
  for (Fruit f : fruits) {
    if(f.killed()!=true){
      if(f.killing()){
        //if(!combo){
          if(f.killed()){
            //for(int i=1;i<fruits.size(); i++){
              //if(fruits.get(i).killed()){
                combocount++;
                System.out.println(combocount);
                //combo=true;
              //}
            //}
          //}
          //combo=false;
        }
        f.kill();  
        
        if(f.isdouble() && doubled==false){
         doubled=true; 
         timingd= millis();
        }
        if(f.ended()==false){         
            if(f.isdouble()==false){
               f.setdouble(true);
            }
            score++;
            if(doubled==true){
              score++;
              if(millis()-timingd>=5000){
                  doubled=false;
                  f.setdouble(false);
             }
          }
        }
        if(f.isfrozen() && freeze==false){
         freeze=true; 
         //f.setfreeze(false);
         timing= millis();
        }       
        if(f.isfrenzy()){ //&& frenzy==false){
           frenzy=true; 
           f.setfrenzy(false);           
           timingf=2;
        }
      }
    }
  }
  }
  
  
  void mouseClicked(){
    
    if((mouseX<=(width/2)-60+100 && mouseX>=(width/2)-60) && (height/2>=mouseY-50 && height/2<=mouseY+50)){
     startup();
     started=true;
     time=millis();
     addedtime=time;
     time=61000;
     //time=60;
    }
  }
