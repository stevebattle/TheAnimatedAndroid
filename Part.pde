class Part {
  PImage img;
  float scaling;
  
  Part(String filename, float scaling) {
    img = loadImage(filename);
    this.scaling = scaling;
  }
  
  PVector midpoint(PVector a, PVector b) {
    return new PVector((a.x+b.x)/2,(a.y+b.y)/2);
  }
  
  float angleBetween(PVector a, PVector b) { 
    return atan2(b.y-a.y, b.x-a.x); 
  }
  
  void draw(PVector a, PVector b) {
    pushMatrix();
    PVector m = midpoint(a,b);
    translate(m.x,m.y);
    scale(scaling);
    rotate(angleBetween(a,b)-PI/2);
    image(img,0,0);
    popMatrix();
  }
  
}
