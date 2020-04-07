float c = 100;
int NI = 100, NJ = 100;
PVector[][] poss = new PVector[NI][NJ];

void setup(){
  size(700, 700, P3D);
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(255);
  lights();
  noStroke();
  translate(width/2, height/2);
  rotateX((float)frameCount/100);
  rotateY((float)frameCount/100);
  rotateZ((float)frameCount/100);
  for(int i = 0; i < NI; i++){
    float u = map(i, 0, NI, 0, TWO_PI);
    for(int j = 0; j < NJ; j++){
      float v = map(j, 0, NJ, 100, -100);
      float x = c*(float)Math.cosh(v/c)*cos(u);
      float y = c*(float)Math.cosh(v/c)*sin(u);
      float z = v;
      poss[i][j] = new PVector(x, y, z);
    }
  }
  beginShape(TRIANGLE_STRIP);
  for(int j = 0; j < NJ-1; j++){
    for(int i = 0; i < NI; i++){
      PVector pa = poss[i][j];
      PVector pb = poss[i][(j+1)%NJ];
      float hue = map(j, 0, NJ, 0, 360)+frameCount*2;
      fill(hue%360, 100, 100);
      vertex(pa.x, pa.y, pa.z);
      vertex(pb.x, pb.y, pb.z);
      //point(pa.x, pa.y, pa.z);
    }
  }
  endShape();
}