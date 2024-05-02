float r1=200;
float r2=100;
float m1=5;
float m2=10;
float a1=PI;
float a2=PI;
float a1V=0;
float a2V=0.0001;  
float g = 0.9;

float px2=0;
float py2=0;

float px1=0;
float py1=0;

PGraphics canvas;

void setup() {
  size(1000,1000);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}
  
void draw() {
  float num1 = -g * (2 * m1 + m2) *  sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2 * sin(a1-a2)*m2;
  float num4 = (a2V*a2V) * r2 + (a1V*a1V) * r1 * cos(a1-a2);
  float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1A = (num1 + num2 + num3 * num4) / den;
  
  num1 = 2 * sin(a1-a2);
  num2 = (a1V*a1V*r1*(m1+m2));
  num3 = g * (m1+m2) * cos(a1);
  num4 = a2V*a2V*r2*m2*cos(a1-a2);
  den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2A = (num1 * (num2 + num3 + num4)) / den;
  
  //background(255);
  image(canvas, 0,0);
  stroke(0);
  strokeWeight(2);
  
  translate(width/2, height/2);
  
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  
  line(0,0,x1,y1);
  fill(0);
  ellipse(x1,y1,m1,m1);
  
  line(x1,y1,x2,y2);
  fill(0);
  ellipse(x2,y2,m2,m2);
  
  a1V+= a1A;
  a2V+= a2A;
  a1+= a1V;
  a2+= a2V;
  
  a1V *= 0.997;
  a2V *= 0.997;
  
  canvas.beginDraw();
  canvas.translate(width/2, height/2);
  canvas.strokeWeight(2);
  if (frameCount > 1){
    canvas.stroke(0);
    canvas.line(px2,py2, x2, y2);
    canvas.stroke(0,0,255);
    canvas.line(px1,py1, x1, y1);
  }
  canvas.endDraw();
  
  px2 = x2;
  py2 = y2;
  px1 = x1;
  py1 = y1;
}
