// circle variables
float diameter = 150;
float X = 0;
float Y = 0;
int circle_activate = 0;

// animation
float easing = 0.1;

// text
int already_over = 0; // circle already over/in text?
int circle_touch = 0; // number of times circle has touched text

// objects
Circle circle = new Circle(X, Y, diameter);
Text kalp = new Text("Kalp Aghada", width/2, height/2);

// fonts
PFont f;
PFont g;
PFont m;
PFont d;
PFont b;
PFont c;
PFont j;
PFont k;
PFont a;
PFont p;

void setup() {
  size(displayWidth, displayHeight);
  
  // fonts setup
  f = createFont("LeagueSpartan-Black.ttf", 54);
  g = createFont("NotoSerifGujarati-Regular.ttf", 54);
  m = createFont("Gulzar-Regular.ttf", 54);
  d = createFont("TiroDevanagariSanskrit-Regular.ttf", 54);
  b = createFont("TiroBangla-Regular.ttf", 54);
  c = createFont("LongCang-Regular.ttf", 54);
  j = createFont("SawarabiMincho-Regular.ttf", 54);
  k = createFont("NanumBrushScript-Regular.ttf", 54);
  a = createFont("Arima-Regular.ttf", 54);
  p = createFont("TiroGurmukhi-Regular.ttf", 54);
  
  
  
  textFont(f);
  kalp.X = width/2;
  kalp.Y = height/2;
  kalp.W = textWidth(kalp.string);
  kalp.H = (textAscent() + textDescent())/2;
  
  noStroke();
}

String kalpText(int x) {
  if (x == 1) {
    textFont(g);
    return "કલ્પ અઘાડા";
  }
  else if (x == 2) {
    textFont(m);
    return "کالپ اغادا";
  }
  else if (x == 3) {
    textFont(d);
    return "कल्प अघाड़ा";
  }
  else if (x == 4) {
    textFont(b);
    return "কল্প আঘাদা";
  }
  else if (x == 5) {
    textFont(c);
    return "卡尔普阿加达";
  }
  else if (x == 6) {
    textFont(j);
    return "カルプアガダ";
  }
  else if (x == 7) {
    textFont(k);
    return "칼프 아가다";
  }
  else if (x == 8) {
    textFont(a);
    return "കൽപ്പ് അഘദ";
  }
  else if (x == 9) {
    textFont(p);
    return "ਕਲਪ ਅਘਾਦਾ";
  }
  else if (x == 10) {
    textFont(a);
    return "கல்ப் அகாத";
  }
  return "";
}

void draw() {
  
  background(0);
  
  if ((dist(circle.X, circle.Y, mouseX, mouseY) < circle.diameter/2) & mousePressed) {
    circle_activate ^= 1;
  }
  
  //if( (dist(circle.X, circle.Y, mouseX, mouseY) < circle.diameter/2) && mousePressed ) {
  if (circle_activate == 1) {
    float targetX = mouseX;
    float dx = targetX - circle.X;
    circle.X += dx * easing;
    
    float targetY = mouseY;
    float dy = targetY - circle.Y;
    circle.Y += dy * easing;
  }
  //}
  
  /*
  if (abs(mouseX - kalp.X) < kalp.W &&
      abs(mouseY - kalp.Y) < kalp.H) {
    kalp.X += random(-5, 5);
    kalp.Y += random(-5, 5);
  }
  */
  /*
  if (
    ( int(dist(circle.X, circle.Y, kalp.X - kalp.W/2, kalp.Y + kalp.H/2)) < circle.diameter/2 ) 
    || ( int(dist(circle.X, circle.Y, kalp.X - kalp.W/2, kalp.Y - kalp.H/2)) < circle.diameter/2)
    || int(dist(circle.X, circle.Y, kalp.X + kalp.W/2, kalp.Y + kalp.H/2)) < circle.diameter/2
    || int(dist(circle.X, circle.Y, kalp.X + kalp.W/2, kalp.Y - kalp.H/2)) < circle.diameter/2
    || int(dist(circle.X, circle.Y, kalp.X, kalp.Y + kalp.H/2)) < circle.diameter/2
    || int(dist(circle.X, circle.Y, kalp.X, kalp.Y - kalp.H/2)) < circle.diameter/2
    || int(dist(circle.X, circle.Y, kalp.X - kalp.W/2, kalp.Y)) < circle.diameter/2
    || int(dist(circle.X, circle.Y, kalp.X + kalp.W/2, kalp.Y)) < circle.diameter/2
  ) { // if circle entering into text area fresh
  */
  if (
    abs(circle.X - kalp.X) < kalp.W &&
    abs(circle.Y - kalp.Y) < kalp.H
  ) {
    if (already_over == 0) {
      already_over ^= 1;
      if (circle_touch == 11) {
        circle_touch = 0;
      }
      circle_touch += 1;
      
      kalp.string = kalpText(circle_touch);
      //kalp.string = "Okay.";
      kalp.W = textWidth(kalp.string);
      kalp.H = (textAscent() + textDescent())/2;
    }
  }
  else {
    already_over ^= 1;
    textFont(f);
    kalp.string = "Kalp Aghada";
    kalp.W = textWidth(kalp.string);
    kalp.H = (textAscent() + textDescent())/2;
  }
  
  fill(255);
  ellipse(circle.X, circle.Y, circle.diameter, circle.diameter);

  fill(255, 204, 0);
  textAlign(CENTER);
  
  text(kalp.string, kalp.X, kalp.Y);
  
}

class Text {
  String string;
  float X;
  float Y;
  float W = 0;
  float H = 0;
  Text (String s, float x, float y) {
    string = s;
    X = x;
    Y = y;
  }
}

class Circle {
  float diameter;
  float X;
  float Y;
  Circle (float x, float y, float d) {
    X = x;
    Y = y;
    diameter = d;
  }
}
