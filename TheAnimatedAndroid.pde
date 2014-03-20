/* @pjs preload="background/optics_angel.jpg, part/head3.gif, part/neck1.gif, part/torso3.gif, part/upper_arm3.gif, part/forearm3.gif, part/upper_leg3.gif, part/lower_leg3.gif" */

int HEAD = 0;
int LEFT_SHOULDER = 1;
int LEFT_ELBOW = 2;
int LEFT_WRIST = 3;
int RIGHT_SHOULDER = 4;
int RIGHT_ELBOW = 5;
int RIGHT_WRIST = 6;
int LEFT_HIP = 7;
int LEFT_KNEE = 8;
int LEFT_ANKLE = 9;
int RIGHT_HIP = 10;
int RIGHT_KNEE = 11;
int RIGHT_ANKLE = 12;

String[] data;
PVector[] cache;
int points, frames;
int frame=0;

PImage bg;
Head head;
Part torso, upperArm, forearm, upperLeg, lowerLeg, neck;

PVector point(int f, int p) {
  int i = 2 + f*points*2 + p*2;
  PVector v = new PVector(int(data[i]),int(data[i+1]));
  if (v.x==0 && v.y==0) v = cache[p];
  else cache[p] = v;
  return v;
}

void setup() {
  // needs to be the same size as the background image
  size(700,525);
  bg = loadImage("background/optics_angel.jpg");
  
  data = loadStrings("motion/walk");
  points = int(data[0]);
  frames = int(data[1]);
  frameRate(25);
  
  head = new Head("part/head3.gif",0.15);
  neck = new Part("part/neck1.gif",0.5);
  torso = new Part("part/torso3.gif",0.13);
  upperArm = new Part("part/upper_arm3.gif",0.15);
  forearm = new Part("part/forearm3.gif",0.15);
  upperLeg = new Part("part/upper_leg3.gif",0.15);
  lowerLeg = new Part("part/lower_leg3.gif",0.15);
  
  cache = new PVector[points];
}

void draw() {
  // in processingjs imageMode() applies to the background image
  imageMode(CORNER);
  background(bg);
  imageMode(CENTER);


  // The right-elbow is occluded
  forearm.draw(point(frame,LEFT_ELBOW),point(frame,RIGHT_WRIST));
  lowerLeg.draw(point(frame,RIGHT_KNEE),point(frame,RIGHT_ANKLE));
  upperLeg.draw(point(frame,LEFT_HIP),point(frame,RIGHT_KNEE));
  lowerLeg.draw(point(frame,LEFT_KNEE),point(frame,LEFT_ANKLE));
  upperLeg.draw(point(frame,LEFT_HIP),point(frame,LEFT_KNEE));
  neck.draw(point(frame,HEAD),point(frame,LEFT_SHOULDER));
  head.draw(point(frame,HEAD),point(frame,LEFT_SHOULDER));
  torso.draw(point(frame,LEFT_SHOULDER),point(frame,LEFT_HIP));
  forearm.draw(point(frame,LEFT_ELBOW),point(frame,LEFT_WRIST));
  upperArm.draw(point(frame,LEFT_SHOULDER),point(frame,LEFT_ELBOW));
  
//  for (int i=0; i<points; i++) {
//    PVector p = point(frame,i);
//    fill(0);
//    if (p!=null) ellipse(p.x,p.y,5,5);
//  }

  frame = (frame+1) % frames;
}
