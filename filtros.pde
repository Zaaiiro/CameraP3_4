class Filtros{
  
  int delta;
  float r,g,b,R,G,B;
  
  
  Filtros(){
    delta=15;
  }
  
  void display(){
    background(0);
    if(cntrl==0){image(video,0,0);}
    else{
    for (int i=0; i<video.width; i+=delta){
      for (int j=0; j<video.height; j+=delta){
        color c = video.get(i,j);
        switch(cntrl){
          case 1:
            fill(c);
            noStroke();
            ellipse(i,j,15,15);
            break;
          case 2:
            fill(c);
            textSize(15);
            text("01",i,j);
            break;
          case 3:
            stroke(c);
            point(i,j);
            strokeWeight(3);
            point(i-7.5,j+3.75);
            point(i+7.5,j-3.75);
            point(i+3.75,j-7.5);
            point(i-3.75,j+7.5);
            break;
          case 4:
            fill(c);
            noStroke();
            rectMode(CENTER);
            rect(i,j,15,15);
            break;
          case 5:
            stroke(c);
            strokeWeight(9);
            line(i,j,i-10,j-10);
            
          }
        }
      }
    }
  }
  
  void cambio()
  {
    if(keyPressed){
      if(key== 'a'){
        if(cntrl>4){
          cntrl=0;
          keyPressed=false;
        } else {
          cntrl++;
          keyPressed=false;
        }
      }
    }
  }
  
  void detector(){
    video.loadPixels();
    float promX=0;
    float promY=0;
    int contador=0;
    
    for(int x=0; x<video.width; x++){
      for(int y=0; y<video.height; y++){
        int loc = x+y*video.width;
        color currentColor = video.pixels[loc];
        r = red(currentColor);
        g = green(currentColor);
        b = blue(currentColor);
        R = red(detector);
        G = green(detector);
        B = blue(detector);
        
        float d = dist(r,g,b, R,G,B);
        
        if (d < hue){
          promX += x;
          promY += y;
          contador++;
        }
      }
    }
    if(contador>0){
      promX = promX/ contador;
      promY = promY/ contador;
      
      fill(detector,50);
      stroke(0,50);
      strokeWeight(1);
      ellipse(promX, promY, 8, 8);
    }
    
    if((mousePressed) && (mouseButton==LEFT)){
      ////////////////////Fijar objeto a detectar
      int loc = mouseX + mouseY * video.width;
      detector = video.pixels[loc];
    }
    
    fill(200);
    textSize(10);
    text("Presiona la letra 'a' para cambiar de filtro", 0,10);
   
    if((promX<=160) && (cntrl==0)){
       cntrl+=1; 
    }
    if((promX<=160) && (cntrl==1)){
       cntrl+=1; 
    } 
    if((promX<=160) && (cntrl==2)){
       cntrl+=1; 
    }
    if((promX<=160) && (cntrl==3)){
       cntrl+=1; 
    }
    if((promX<=160) && (cntrl==4)){
       cntrl+=1;
    }
    if((promX<=160) && (cntrl==5)){
       cntrl=0; 
    }
  }
}
