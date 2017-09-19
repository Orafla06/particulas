
ArrayList <particula> particulas;  //particulas, clase, particulas, es la forma de llamartas a todas de manera grupal


void setup(){
 size(400,400); 
 particulas = new ArrayList <particula>();
 
 for (int i=0; i<400; i++){
  float xp =random (400);
  float yp = random(400);
  float vp = random(4);
  float ap = random(TWO_PI); //TWO_PI es la vuelta comleta al círculo
  float tp = random(1,20);
  color cp = color (random(255), random (255),random(255));
  
  particula p = new particula(xp,yp,vp,ap,tp,cp); 
  particulas.add(p); //
 }
}


void draw(){
 background(50);
 
  for (particula p : particulas){
    p.display();
    p.movimiento();
    p.rebota();
  }
}

void mousePressed(){
  particula foo = new particula(mouseX, mouseY);
  particulas.add(foo);
}

class particula{
  float x,y,v,a,t;     //velocidad, angulo, tamaño
  color c;
  
  particula(float x_, float y_, float v_, float a_, float t_, color c_){
    x=x_;
    y=y_;
    v=v_;
    a=a_;
    t=t_;
    c=c_;
  }
  
  particula (){
   x = random (400); 
   y = random (400);
   v = random (10);
   a = random (TWO_PI);
   t = random (1,30);
   c = color (random(255),random(255),random(255));
  }
  
  particula(float x_, float y_){
    x = x_;
    y = y_;
    v = random(10);
    a = random(TWO_PI);
    t = random(1,30);
    c = color(random(255), random(255), random(255));
  }
    
  void display(){ //para pasarle al objeto la orden de que se muestre
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(c);
  ellipse(0,0, t,t);
  popMatrix();
  }

  void movimiento (){

    x += sin(v);
    y += cos(v);

  }
  
  void rebota(){
    if (y<=0){
      v*= a;
    }
    if (y>=400){
      v*= a;
    }
    if (x<=0){
      v*= a;
    }
    if (x>=400){
      v *= a;
    }    
    
  }
  
  
}