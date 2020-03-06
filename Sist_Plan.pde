//import gifAnimation.*;

//GifMaker ficherogif;

Planeta sol;
Planeta mercurio;
Planeta venus;
Planeta tierra;
Planeta luna;
Planeta marte;
Planeta jupiter;
Planeta ganimedes;

float R;

Punto pos_absoluta;

float rotacionX = 0;
float rotacionY = 0;

float velocidad = 0;

boolean subir = false;
boolean bajar = false;
boolean girar_izquierda = false;
boolean girar_derecha = false;
boolean acelera = false;
boolean frena = false;

boolean pausa = false;
boolean modo_pantalla = true;

int cuenta_frames = 0;

void setup() { 
  size(1600, 1000, P3D);
  strokeWeight(0);
  noFill();
  
  //ficherogif = new GifMaker( this, "sistema_planetario.gif");
  //ficherogif.setRepeat(0);
  
  R = (height/2) * tan(PI/3);
  pos_absoluta = new Punto(width/2, height/2, R);
  
  sol = new Planeta("Sol", "sol.png", 0, PI/1024, 0, 100, PI/1024);
  mercurio = new Planeta("Mercurio", "mercurio.jpg", random(0, TWO_PI), PI/512, 150, 10, PI/128);
  venus = new Planeta("Venus", "venus.jpg", random(0, TWO_PI), PI/1024, 200, 15, PI/128);
  tierra = new Planeta("Tierra", "tierra.jpg", random(0, TWO_PI), PI/1340, 300, 25, PI/128);
  luna = new Planeta("Luna", "luna.jpg", random(0, TWO_PI), PI/128, 45, 8, PI/128);
  marte = new Planeta("Marte", "marte.jpg", random(0, TWO_PI), PI/1580, 400, 25, PI/128);
  jupiter = new Planeta("Júpiter", "jupiter.jpg", random(0, TWO_PI), PI/2024, 700, 40, PI/256);
  ganimedes = new Planeta("Ganímedes", "ganimedes.jpg", random(0, TWO_PI), PI/128, 60, 5, PI/128);
  
  noStroke();
}

void actualizar_perspectiva(){
  
  if(subir){
    rotacionX -= PI/512;
  }
  
  if(bajar){
    rotacionX += PI/512;
  }
  
  if(girar_derecha){
    rotacionY -= PI/256;
  }
  
  if(girar_izquierda){
    rotacionY += PI/256;   
  }
  
  if(acelera && velocidad < 1){
    velocidad += 0.1;  
  }
  
  if(frena && velocidad > 0){
    velocidad -= 0.1;
  }
    
  pos_absoluta.setX(pos_absoluta.getX() - velocidad * sin(rotacionY));
  pos_absoluta.setY(pos_absoluta.getY() + velocidad * abs(cos(rotacionY)) * sin(rotacionX));
  pos_absoluta.setZ(pos_absoluta.getZ() - velocidad * cos(rotacionY) * cos(rotacionX));
  
  //println(pos_absoluta.getX() + ", " + pos_absoluta.getY() + ", " + pos_absoluta.getZ());
}

void imprime_leyenda(){
  textFont(createFont("Arial", 22));
  textAlign(LEFT, TOP);
  
  text("Para cambiar primera persona / vista panorámica pulse (c)", 28, 28);
  text("Para controlar la nave usar teclas de dirección", 28, 56);
  text("Para acelerar la nave pulse (a), para frenarla (f)", 28, 84);
  text("Para pausar o reiniciar pulse tecla (espacio)", 28, 112);
  
  textFont(createFont("Arial", 18));
  textAlign(CENTER, CENTER);
}

void dibujaSistemaSolar(){

  pushMatrix();
  
  if(modo_pantalla){
    imprime_leyenda();
  }
  
  translate(width/2, height/2, 0);

  actualizar_perspectiva();

  sol.dibuja_planeta(0, null, pos_absoluta, modo_pantalla);
  mercurio.dibuja_planeta(0, null, pos_absoluta, modo_pantalla);
  venus.dibuja_planeta(0, null, pos_absoluta, modo_pantalla);
  tierra.dibuja_planeta(0, null, pos_absoluta, modo_pantalla);
  
  Punto pos_rel = tierra.getPosicionRelativa();
  luna.dibuja_planeta(0, pos_rel, pos_absoluta, modo_pantalla);
  
  marte.dibuja_planeta(0, null, pos_absoluta, modo_pantalla);
  jupiter.dibuja_planeta(0, null, pos_absoluta, modo_pantalla);
  
  pos_rel = jupiter.getPosicionRelativa();
  ganimedes.dibuja_planeta(0, pos_rel, pos_absoluta, modo_pantalla);
  popMatrix();
}

void dibujaNave(){
  strokeWeight(1);
  stroke(0, 0, 255);
  
  fill(128, 128, 255);
  
  pushMatrix();
  
  translate(pos_absoluta.getX(), pos_absoluta.getY(), pos_absoluta.getZ());
  
  rotateY(rotacionY);
  rotateX(rotacionX);
  
  sphere(5);
  
  pushMatrix();
  translate(0, 0, -10);
  stroke(255, 100, 16);
  sphere(1.5);
  stroke(0, 0, 255);
  popMatrix();
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 20);    
  popMatrix();
   
  popMatrix();
  
  fill(255);
  noFill();
  stroke(255);
  strokeWeight(0);
}

void draw() {
  background(0);
  
  if(!modo_pantalla){
    camera(pos_absoluta.getX(), pos_absoluta.getY(), pos_absoluta.getZ(),
             pos_absoluta.getX() - R * sin(rotacionY),
             pos_absoluta.getY() + R * abs(cos(rotacionY)) * sin(rotacionX),
             -R * cos(rotacionY) * cos(rotacionX),
           0, 1, 0);
  }else{
    camera(width/2, height/2, R, width/2, height/2, 0, 0, 1, 0);
  }
  
  dibujaSistemaSolar();
  dibujaNave();
  actualizar_perspectiva();
  
  //if(cuenta_frames == 5){
  //  ficherogif.addFrame();
  //  cuenta_frames = 0;
  //}
  
  //cuenta_frames++;
}

void keyPressed(){
  if (key == CODED && keyCode == UP) {
    subir = true;  
  }
  
  if (key == CODED && keyCode == DOWN) {
    bajar = true;
  }
  
  if (key == CODED && keyCode == LEFT) {
    girar_izquierda = true;  
  }
  
  if (key == CODED && keyCode == RIGHT) {
    girar_derecha = true;
  }
  
  if(key == ' '){
    if(pausa){
      pausa = false;
      loop();
    }else{
      pausa = true;
      noLoop();
    }
  }
  
  if(key == 'a' || key == 'A'){
    acelera = true;
  }
  
  if(key == 'f' || key == 'F'){
    frena = true;  
  }

  if(key == 'c' || key == 'C'){
    if(modo_pantalla){  
      modo_pantalla = false;
    }else{
      modo_pantalla = true;
    }
  }
  
  //if(key == 'r'){
  //  ficherogif.finish();
  //}
}

void keyReleased(){
  if (key == CODED && keyCode == UP) {
    subir = false;  
  }
  
  if (key == CODED && keyCode == DOWN) {
    bajar = false;
  }
  
  if (key == CODED && keyCode == LEFT) {
    girar_izquierda = false;
  }
  
  if (key == CODED && keyCode == RIGHT) {
    girar_derecha = false;
  }
  
  if(key == 'a' || key == 'A'){
    acelera = false;
  }
  
  if(key == 'f' || key == 'F'){
    frena = false;  
  }
}
