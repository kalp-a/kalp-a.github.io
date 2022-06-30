int circleX = 100;
int circleY = 100;
int diameter = 150;

PFont f;

void setup() {
  size(700, 500);
  f = createFont("../../LeagueSpartan-Black.ttf", 24);
  textFont(f);
}

void draw() {
  
  background(0);
  fill(255);
  noStroke();
  //next step. how do i know if the mouse is over that circle? 
  
  if(dist(circleX, circleY, mouseX, mouseY) < diameter/2 && mousePressed)  {
    circleX = mouseX;
    circleY = mouseY;
  }
  
  fill(255);
  ellipse(circleX, circleY, diameter, diameter);

  fill(255, 204, 0);
  textAlign(CENTER);
  text("Kalp Aghada", width/2, height/2);
  
}
