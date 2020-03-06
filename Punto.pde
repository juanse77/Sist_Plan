class Punto{
  private float x;
  private float y;
  private float z;
  
  public Punto(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public void setCoordenadas(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public void setX(float x){
    this.x = x;
  }
  
  public void setY(float y){
    this.y = y;
  }
  
  public void setZ(float z){
    this.z = z;
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public float getZ(){
    return z;
  }
  
  public float productEsc(Punto p){
    return this.x * p.getX() + this.y * p.getY() + z * p.getZ();
  }
  
  public Punto getVec(Punto p){
    Punto aux = new Punto(0, 0, 0);
    
    aux.setX(p.getX() - this.x);
    aux.setY(p.getY() - this.y);
    aux.setZ(p.getZ() - this.z);
    
    return aux;
  }
  
  public float getModulo(){
    return sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
  }
  
  public float getModulo(float x, float y, float z){
    return sqrt(x * x + y * y + z * z);
  }
  
}
