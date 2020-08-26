int res = 100;//resolution
float r1, r2;

void setup(){
  size(500, 500, P3D);
  //fullScreen(P3D);
  colorMode(HSB, 360, 100, 100);
  r1 = height/3;
  r2 = height/10;
}

void draw(){
  background(360);
  lights();
  translate(width/2, height/2);
  rotateX(float(frameCount)/500);
  rotateY(float(frameCount)/1000);
  rotateZ(float(frameCount)/100);
  noStroke();
  beginShape(TRIANGLE_STRIP);
  for(int i=0; i<=res; i++){
    float theta = map(i, 0, res, 0, TWO_PI);
    float r;
    float theta2 = map(i, 0, res, 0, PI);
    //fill(map(i, 0, res, 0, 360), 100, 100);
    r = r1 + cos(theta2)*r2;
    vertex(cos(theta)*r, sin(theta)*r, sin(theta2)*r2);
    theta2 += PI;
    r = r1 + cos(theta2)*r2;
    vertex(cos(theta)*r, sin(theta)*r, sin(theta2)*r2);
  }
  endShape();
}
