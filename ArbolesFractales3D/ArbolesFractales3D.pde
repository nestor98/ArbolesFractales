float rotX = 0;
float rotY = 0;// Rotacion con el raton

float rotRate = 0.01;

float deg = PI/9; // inclinacion de las ramas
float deg1 = 0; // Desviacion de la rama 1
float deg2 = 0; // Y de la 2
float deg3 = 0; // Y la 3

boolean show = true;

float conversion = 0.72; // longitud de la rama siguiente
float weightConv = 0.6;

float weight = 7;
float longitud = 220;

void dibujarRamas(float len, float weight) {
  if (len>5) {
     strokeWeight(weight);
     //Rama raiz:
     line (0,0,0,-len);
     translate(0, -len);
     //Rama 1:
     pushMatrix();
     rotateY(2.0*PI/3);
     rotateZ(deg+deg1);
     dibujarRamas(conversion*len, weight*weightConv);
     popMatrix();
     //Rama 2
     pushMatrix();
     rotateY(4.0*PI/3);
     rotateZ(deg+deg2);
     dibujarRamas(conversion*len, weight*weightConv);
     popMatrix();
     //Rama 3
     pushMatrix();
     rotateZ(deg+deg3);
     dibujarRamas(conversion*len,weight*weightConv);
     popMatrix();
  }
}


void setup() {
   size(1600,900,P3D);
   background(0);
   stroke(255);
   
   frameRate(30);
   
}

void draw() {
   background(0);
   pushMatrix();
   translate(width/2, 11*height/12, 0); // Principio
   
   rotateX(rotX); // Control con el raton
   rotateY(rotY);
   
   dibujarRamas(longitud, weight); // Se dibuja el arbol
   popMatrix();
   if (show){
     text("Ocultar: Z", 0, 11*height/12-90);
     text("Rotar: Raton (arrastrar)", 0, 11*height/12-60);
     text("Guardar: X", 0, 11*height/12-30);
     text("Anchura(Q,A) = "+nf(weight,0,1),0,11*height/12);
     text("Long(W,S) = "+longitud,150,11*height/12);
     text("Angulo(E,D) = "+deg/PI+" PI",300,11*height/12);
     text("ProporcionLong(R,F) = "+conversion,0,11*height/12+30);
     text("ProporcionAnch(T,G) = "+nf(weightConv,0,2),300,11*height/12+30);
     text("Asimetria1(Y,H) = "+deg2/PI+" PI",width-200,11*height/12);
     text("Asimetria2(U,J) = "+deg1/PI+" PI",width-200,11*height/12+30);
     text("Asimetria3(I,K) = "+deg3/PI+" PI",width-200,11*height/12+60);
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
    deg2=(deg2+PI/72)%(2*PI);
  }
  else if (key == 'H') {
    deg2=(deg2-PI/72)%(2*PI);
  }
  else if (key == 'U') {
    deg1=(deg1+PI/72)%(2*PI);
  }
  else if (key == 'J') {
    deg1=(deg1-PI/72)%(2*PI);
  }
  else if (key == 'I') {
    deg3=(deg3+PI/72)%(2*PI);
  }
  else if (key == 'K') {
    deg3=(deg3-PI/72)%(2*PI);
  }
  else if (key == 'Z') {
    show = !show;
  }
  else if (key == 'X') {
    save("arbol.jpg");
  }
}

void mouseDragged(){
  rotX-=(pmouseY-mouseY)*rotRate;
  rotY-=(pmouseX-mouseX)*rotRate;
}
