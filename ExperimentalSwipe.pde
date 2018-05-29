int Yellow;
int Red;
int Green;
int Blue;
int Grey;
int LightGrey;
color currentColor;
boolean typeIsRect;
PImage img;

void setup()
{
 size(1377,840);
 background(102);
 frameRate(60);

 currentColor = color(102);




img = loadImage("Background.jpg");
background(img);



 

}

//interface
void draw()
{
 stroke(5);
 smooth();
 

 // Now if the mouse is pressed, paint
 if (mousePressed)
 {
   noStroke();
   fill(0);
   if (typeIsRect)
   {
     if ((mouseX>140) && (mouseY>20) && (mouseX<190) && (mouseY<70))
     {
       rect(mouseX-25,mouseY-25,50,50);
     }
     else
     {
       rect(mouseX-10,mouseY-10,20,20);
     }
   }
   else
   {
     ellipse(mouseX,mouseY,20,20);
   }
 }
}


