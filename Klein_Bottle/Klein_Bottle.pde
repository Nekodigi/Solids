float scale = 40;
int NI = 10, NJ = 10;
PVector[][] poss = new PVector[NI][NJ];

void setup(){
  //size(700, 700, P3D);
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(360);
  lights();
  noStroke();
  translate(width/2, height/2);
  rotateX((float)frameCount/1000);
  rotateY((float)frameCount/200);
  rotateZ((float)frameCount/1000);
  for(int i = 0; i < NI; i++){
    float theta = map(i, 0, NI-1, 0, TWO_PI);//loop
    for(int j = 0; j < NJ; j++){
      float phi = map(j, 0, NJ, 0, TWO_PI);
      float x, y;
      float r = 4*(1-cos(theta)/2);
      if(theta < PI) x = 6*cos(theta)*(1+sin(theta))+r*cos(theta)*cos(phi);
      else x = 6*cos(theta)*(1+sin(theta))+r*cos(phi+PI);
      if(theta < PI) y = 16*sin(theta)+r*sin(theta)*cos(phi);
      else y = 16*sin(theta);
      float z = r*sin(phi);
      poss[i][j] = new PVector(x, y, z).mult(scale);
   }
  }
  beginShape(TRIANGLE_STRIP);
  PVector ep = poss[0][NJ-1];
  vertex(ep.x, ep.y, ep.z);
  for(int i = 0; i < NI-1; i++){
    for(int j = 0; j < NJ; j++){
      PVector pa = poss[i][j];
      PVector pb = poss[(i+1)%NI][j];
      float hue = map(i, 0, NI-1, 0, 360)+frameCount*2;
      //fill(hue%360, 100, 100);
      vertex(pa.x, pa.y, pa.z);
      vertex(pb.x, pb.y, pb.z);
      //point(pa.x, pa.y, pa.z);
    }
  }
  PVector sp = poss[NI-1][0];
  vertex(sp.x, sp.y, sp.z);
  endShape();
}