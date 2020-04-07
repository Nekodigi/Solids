Sphere sphere;

void setup(){
  size(500, 500, P3D);
  sphere = new Sphere(new PVector(0, 0, 0), 200);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  rotateX(float(frameCount)/500);
  rotateY(float(frameCount)/1000);
  rotateZ(float(frameCount)/1500);
  sphere.show();
}