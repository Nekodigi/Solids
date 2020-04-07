class Capsule{
  int resI = 32, resJ = 16;
  PVector[][] vertices = new PVector[resI][resJ+2];
  Face[][] faces = new Face[resI][resJ+1];
  //top sphere
  Capsule(PVector spos, PVector epos, float r){
    PVector diff = PVector.sub(epos, spos);
    float l = diff.mag();
    diff.normalize();
    PVector u = diff.copy().mult(-1);
    PVector v = new PVector(0, 1, 0).cross(u).normalize();
    PVector w = u.cross(v).normalize().mult(-1);
    
    float yaw = atan2(diff.x, diff.z);
    float pitch = asin(-diff.y);
    for(int i = 0; i < resI; i++){
      float phi = map(i, 0, resI, 0, TWO_PI);
      for(int j = 0; j <= resJ/2; j++){
        float theta = map(j, 0, resJ, 0, PI);
        float x = r*sin(theta)*cos(phi);
        float y = r*sin(theta)*sin(phi);
        float z = r*cos(theta);
        vertices[i][j] = PVector.mult(u, z).add(PVector.mult(v, y)).add(PVector.mult(w, x)).add(spos);
      }
    }
    //bottom sphere
    for(int i = 0; i < resI; i++){
      float phi = map(i, 0, resI, 0, TWO_PI);
      for(int j = resJ/2; j <= resJ; j++){
        float theta = map(j, 0, resJ, 0, PI);
        float x = r*sin(theta)*cos(phi);
        float y = r*sin(theta)*sin(phi);
        float z = r*cos(theta);
        vertices[i][j+1] = PVector.mult(u, z-l).add(PVector.mult(v, y)).add(PVector.mult(w, x)).add(spos);
      }
    }
    //connect vertex
    for(int i = 0; i < resI; i++){
      for(int j = 0; j <= resJ; j++){
        faces[i][j] = new Face(i*(resJ+2)+j, i*(resJ+2)+(j+1), (i+1)%resI*(resJ+2)+(j+1), (i+1)%resI*(resJ+2)+j);
      }
    }
  }
  
  void showFace(Face face){
    beginShape();
    for(int id : face.vids){
      vertex(vertices[int(id/(resJ+2))][id%(resJ+2)]);
    }
    endShape();
  }
  
  void show(){
    for(int i = 0; i < resI; i++){
      for(int j = 0; j <= resJ+1; j++){
        point(vertices[i][j]);
      }
    }
    
    for(int i = 0; i < resI; i++){
      for(int j = 0; j <= resJ; j++){
        showFace(faces[i][j]);
      }
    }
  }
  
  String toCSV(){
    String str = PVtoCSV() + "/" + FtoCSV();
    return str;
  }
  
  String PVtoCSV(){
    String str = "";
    for(int i = 0; i < resI; i++){
      for(int j = 0; j <= resJ+1; j++){
        PVector v = vertices[i][j];
        str += String.valueOf(v.x)+" "+String.valueOf(v.y)+" "+String.valueOf(v.z)+"\n";;
      }
    }
    str = str.substring(0, str.length()-1);
    return str;
  }
  
  String FtoCSV(){
    String str = "";
    for(int i = 0; i < resI; i++){
      for(int j = 0; j <= resJ; j++){
        Face f = faces[i][j];
        str += String.valueOf(f.vids[0])+" "+String.valueOf(f.vids[1])+" "+String.valueOf(f.vids[2])+" "+String.valueOf(f.vids[3])+"\n";;
      }
    }
    str = str.substring(0, str.length()-1);
    return str;
  }
}