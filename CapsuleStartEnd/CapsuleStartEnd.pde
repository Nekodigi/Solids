float z = -100;

void setup(){
  size(500, 500, P3D);
  //fullScreen(P3D);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  Capsule cap = new Capsule(new PVector(0, 0, 0), new PVector(-width/2+mouseX, -height/2+mouseY, z), 100);
  cap.show();
}

void mouseWheel(MouseEvent event) {
  z += event.getCount()*10;
}