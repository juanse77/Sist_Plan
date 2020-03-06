class Planeta{
  private final String ruta_recursos = "texturas/";
  private float angulo_rotacion = 0;
  private final float v_rotacion;
  private final String nombre_planeta;
  private final PImage img;
  private final PShape planeta;
  private float angulo;
  private final float velocidad_traslacion;
  private final float radio_orbita;
  private final float radio_planeta;
  private final Punto posicion_relativa;
  
  public Planeta(String nombre_planeta, String img_file, float angulo, float velocidad_traslacion, float radio_orbita, float radio_planeta, float v_rotacion){
    this.nombre_planeta = nombre_planeta;
    this.img = loadImage(ruta_recursos + img_file);
    this.radio_planeta = radio_planeta;
    this.planeta = createShape(SPHERE, this.radio_planeta);
    this.planeta.setTexture(this.img);
    this.angulo = angulo;
    this.velocidad_traslacion = velocidad_traslacion;
    this.radio_orbita = radio_orbita;
    this.posicion_relativa = new Punto(0, 0, 0);
    this.v_rotacion = v_rotacion;
  }
  
  private float getAngulo(float anterior, float velocidad){
    float angulo = (anterior + velocidad) % TWO_PI;
    return angulo;
  }
  
  public void dibuja_planeta(float rotacionX, Punto pos_rel, Punto pos_camara, boolean modo_pantalla){
    pushMatrix();
    
    Punto pos_absoluta = new Punto(0 ,0 , 0);
    if(pos_rel != null){
      translate(pos_rel.getX(), pos_rel.getY(), pos_rel.getZ());
      pos_absoluta = pos_rel;
    }
   
    strokeWeight(1);
    stroke(128);
    
    pushMatrix();
    rotateX(PI/2);
    circle(0, 0, 2 * radio_orbita);
    popMatrix();
    
    strokeWeight(0);
    
    this.angulo = getAngulo(this.angulo, this.velocidad_traslacion);
    this.posicion_relativa.setCoordenadas(-this.radio_orbita * cos(this.angulo), 0, this.radio_orbita * sin(this.angulo));
    translate(this.posicion_relativa.getX(), this.posicion_relativa.getY(), this.posicion_relativa.getZ());
    
    pos_absoluta.setCoordenadas(pos_absoluta.getX() + this.posicion_relativa.getX() + width/2, //se suman todas las traslaciones
                                pos_absoluta.getY() + this.posicion_relativa.getY() + height/2,
                                pos_absoluta.getZ() + this.posicion_relativa.getZ());
    
    pushMatrix();
    this.angulo_rotacion = getAngulo(this.angulo_rotacion, v_rotacion);
    rotateY(this.angulo_rotacion);
    shape(this.planeta);
    popMatrix();
    
    pushMatrix();
    rotateX(-rotacionX);
    
    if(!modo_pantalla){
      // Se calcula el ángulo mediante el producto escalar
      Punto vecZ = new Punto(0, 0, 1);
      Punto vecCamaraPlaneta = pos_absoluta.getVec(pos_camara);
      
      // Se ignora la coordenada Y
      float angulo = acos(vecCamaraPlaneta.getZ() /
        (vecZ.getModulo(vecZ.getX(), 0, vecZ.getZ()) * 
        vecCamaraPlaneta.getModulo(vecCamaraPlaneta.getX(), 0, vecCamaraPlaneta.getZ())));
      
      if(vecCamaraPlaneta.getX() <= 0){
        angulo *= -1;
      }
  
      rotateY(angulo);
    }
    
    text(this.nombre_planeta, 0, this.radio_planeta + 15);
    popMatrix();
    
    popMatrix();
  }
  
  public Punto getPosicionRelativa(){
     return this.posicion_relativa; 
  }

}
