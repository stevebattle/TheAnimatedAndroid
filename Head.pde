class Head {
  PImage img;
  float scaling;
  
  Head(String filename, float scaling) {
    img = loadImage(filename);
    this.scaling = scaling;
  }
  
  void draw(PVector head, PVector shoulder) {
    if (head!=null && shoulder!=null) {
      pushMatrix();
      translate(head.x,head.y);
      scale(scaling);
      image(img,0,0);
      popMatrix();
    }
  }
  
}
