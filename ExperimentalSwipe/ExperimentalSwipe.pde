float x=0,y=0,h=0;
PImage img;
PImage fruit;
void setup()
{
  img=loadImage("background.jpg");
  background(img);
  size(640,480);
}

void draw()
{ 
  background(img);
  rect(250,height/2+h,40,40); 
 x=x+y;
 
 if(y<30) y++;
 
 h = x/4;
 x++;
 
 if (y > 40)
 {
   y = 40;
   
 }
  
   if (y < -30)
 {
   y= -30;
   
 }
}

void mousePressed() {

  y-=80;
}
