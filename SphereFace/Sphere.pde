class Sphere{
  int resI = 16, resJ = 32;
  int vid = 0;
  PVector[][] vertices = new PVector[resI+1][resJ];
  Face[][] faces = new Face[resI][resJ];
  
  Sphere(PVector pos, float r){
    for(int i = 0; i <= resI; i++){
      float phi = map(i, 0, resI, -HALF_PI, HALF_PI);
      for(int j = 0; j < resJ; j++){
        float theta = map(j, 0, resJ, -PI, PI);
        float x = r*cos(theta)*cos(phi);
        float y = r*sin(theta)*cos(phi);
        float z = r*sin(phi);
        vertices[i][j] = new PVector(x, z, y).add(pos);
      }
    }
    for(int i = 0; i < resI; i++){
      for(int j = 0; j < resJ; j++){
        faces[i][j] = new Face(j*(resI+1)+i, j*(resI+1)+(i+1), (j+1)%resJ*(resI+1)+(i+1), (j+1)%resJ*(resI+1)+i);
      }
    }
  }
  
  void showFace(Face face){
    beginShape();
    for(int id : face.vids){
      vertex(vertices[id%(resI+1)][int(id/(resI+1))]);
    }
    endShape();
  }
  
  void show(){
    for(int i = 0; i <= resI; i++){
      for(int j = 0; j < resJ; j++){
        point(vertices[i][j]);
      }
    }
    
    for(int i = 0; i < resI; i++){
      for(int j = 0; j < resJ; j++){
        showFace(faces[i][j]);
      }
    }
  }
}