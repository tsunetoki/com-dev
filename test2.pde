import ddf.minim.*;

Minim minim;
AudioInput in;
float volumeInl;
float volumeInr;
float dl;
float sal;
float dr;
float sar;

void setup() {
  size(500,250);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fill(200,0,0);
}

void draw() {
  delay(200);
  background(0);
  stroke(#FFFFFF);
  strokeWeight(1.5);
  line(250,0,250,250);
  volumeInl = map(in.left.level(), 0, 0.5, 0, width*2);
  volumeInr = map(in.right.level(), 0, 0.5, 0, width*2);
  sal = volumeInl - dl;
  sar = volumeInr - dr;
  if(abs(sal) > 1) {
    dl = dl + sal * 0.1;
  }
  if(abs(sar) > 1) {
    dr = dr + sar * 0.1;
  }
  ellipse((80-(dl*0.83-dr))*2.5, 125, 50+dl/3, 50+dl/3); //描画
}

void stop(){
  in.close();
  minim.stop();
  super.stop();
}