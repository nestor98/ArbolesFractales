

float deg = PI/9; // inclinacion de las ramas
float degDer = 0; // Desviacion a la izquierda
float degIzq = 0; // Y a la derecha

boolean show = true;

float conversion = 0.72; // longitud de la rama siguiente
float weightConv = 0.6;

float weight = 7;
float longitud = 220;

void dibujarRamas(float len, float weight) {
  if (len>5) {
     strokeWeight(weight);
     line (0,0,0,-len);
     
     translate(0, -len);
     pushMatrix();
     rotate(-(deg+degIzq));
     dibujarRamas(conversion*len, weight*weightConv);
     popMatrix();
     pushMatrix();
     rotate(deg+degDer);
     dibujarRamas(conversion*len,weight*weightConv);
     popMatrix();
     
  }
    
  
}
void setup() {
   size(1600,900);
   background(0);
   stroke(255);
  
}

void draw() {
   background(0);
   pushMatrix();
   translate(width/2, 11*height/12); // Principio
   
   dibujarRamas(longitud, weight);
   popMatrix();
   if (show){
     text("Ocultar: Z", 0, 11*height/12-60);
     text("Guardar: X", 0, 11*height/12-30);
     text("Anchura(Q,A) = "+weight,0,11*height/12);
     text("Long(W,S) = "+longitud,150,11*height/12);
     text("Angulo(E,D) = "+deg/PI+" PI",300,11*height/12);
     text("ProporcionLong(R,F) = "+conversion,0,11*height/12+30);
     text("ProporcionAnch(T,G) = "+weightConv,300,11*height/12+30);
     text("AsimetriaIzq(Y,H) = "+degIzq/PI+" PI",width-200,11*height/12);
     text("AsimetriaDer(U,J) = "+degDer/PI+" PI",width-200,11*height/12+30);
   }
}

void keyPressed() {
  if (key >= 'a' && key<='z') {
    key-='a'-'A'; // Conversion de minusculas a mayusculas 
  }
  if (key == 'Q') {
    weight+=0.1;
  }
  else if (key == 'A') {
    weight-=0.1;
  }
  else if (key == 'W') {
    longitud+=10;
  }
  else if (key == 'S') {
    longitud-=10;
  }
  else if (key == 'E') {
    deg=(deg+PI/36)%(2*PI);
  }
  else if (key == 'D') {
    deg=(deg-PI/36)%(2*PI);
  }
  else if (key == 'R') {
    conversion+=0.01;
  }
  else if (key == 'F') {
    conversion-=0.01;
  }
  else if (key == 'T') {
    weightConv+=0.05;
  }
  else if (key == 'G') {
    weightConv-=0.05;
  }
  else if (key == 'Y') {
    degIzq=(degIzq+PI/72)%(2*PI);
  }
  else if (key == 'H') {
    degIzq=(degIzq-PI/72)%(2*PI);
  }
  else if (key == 'U') {
    degDer=(degDer+PI/72)%(2*PI);
  }
  else if (key == 'J') {
    degDer=(degDer-PI/72)%(2*PI);
  }
  else if (key == 'Z') {
    show = !show;
  }
  else if (key == 'X') {
    save("arbol.jpg");
  }
}
