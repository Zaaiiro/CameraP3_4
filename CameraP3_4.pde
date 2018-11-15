import gab.opencv.*;
import processing.video.*;

Capture video;
OpenCV opencv;
Filtros filtros;
int cntrl=0;
color detector;
float hue=25;

void setup(){
  size(640,360);
  opencv= new OpenCV (this, 640,360);
  video = new Capture(this, 640,360);
  video.start();
  
  filtros = new Filtros();
}

void draw(){
  filtros.display();
  filtros.cambio();
  filtros.detector();
  println(cntrl);
}

void captureEvent(Capture video){
  video.read();
}
