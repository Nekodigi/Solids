float r0 = 200;
float r1 = 100;
int NI = 100, NJ = 100;
PVector[][] poss = new PVector[NI][NJ];

void setup(){
  size(700, 700, P3D);
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
    float theta = map(i, 0, NI, 0, TWO_PI);
    for(int j = 0; j < NJ; j++){
      float phi = map(j, 0, NJ, 0, TWO_PI);
      float x = cos(theta)*(r0+r1*cos(phi));
      float y = sin(theta)*(r0+r1*cos(phi));
      float z = r1*sin(phi);
      poss[i][j] = new PVector(x, y, z);
    }
  }
  beginShape(TRIANGLE_STRIP);
  PVector ep = poss[0][NJ-1];
  vertex(ep.x, ep.y, ep.z);
  for(int i = 0; i < NI; i++){
    for(int j = 0; j < NJ; j++){
      PVector pa = poss[i][j];
      PVector pb = poss[(i+1)%NI][j];
      vertex(pa.x, pa.y, pa.z);
      vertex(pb.x, pb.y, pb.z);
      //point(pa.x, pa.y, pa.z);
    }
  }
  PVector sp = poss[0][0];
  vertex(sp.x, sp.y, sp.z);
  endShape();
}