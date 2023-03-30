/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen. 
 */
int value = 0;

PShape map;
PShape buildings;
PShape green;
PShape water;

//float ry;

float x = 450;//500; //400; //width/2;
float y = 250;//150;//width/2;
float z = 100;//50;//-150;
float rx = -1350;//-650;//-450;
float ry = 3700;//3200;//0;

int zone; // reset queen cafe graduate
  
public void setup() {
  size(900, 500, P3D);
  zone=0;
  //stroke(0);
  //noFill();
  //noLoop();
    
  map = loadShape("map.obj");
  buildings = loadShape("buildings.obj");
  green = loadShape("green.obj");
  water = loadShape("water.obj");
  //rotateZ(HALF_PI);
  green.setFill(color(41,152,55));
  buildings.setFill(color(142,147,147));
  water.setFill(color(96,135,175));
  //strokeWeight(10);
  //buildings.setStroke(color(0));

}

public void draw() {
  background(122,194,237);
  lights();
  directionalLight(100, 100, 100, -5, -5, -1);
  translate(x, y, z);
  rotateZ(PI);
  //rotateY(ry);
  rotateX(rx);
  scale(-1.0, 1.0); //mirror across X-axis 
  rotateY(ry);
  shape(buildings);
  shape(water);
  shape(green);
  
  if(zone==0){
    reset();
  }else if(zone==1){
    queens();
  }else if(zone==2){
    cafe();
  }else if(zone==3){
    graduate();
  }
  
  //ry += 0.02;
}

void queens(){
  //x= 500;
  //y = 175;
  //z = 300;
  //rx = -1350;
  //ry = 3650;
  float newx=1000;
  float newy=400;
  float newz=700;
  float newrx=-1400;
  float newry=3650;
  x=lerp(x,newx,0.05);
  y=lerp(y,newy,0.05);
  z=lerp(z,newz,0.05);
  rx =lerp(rx,newrx,1);
  ry=lerp(ry,newry,1);
}

void reset(){
  //x = 450;
  //y = 250;
  //z = 100;
  //rx = -1350;
  //ry = 3650;
  float newx=950;
  float newy=500;
  float newz=550;
  float newrx=-1350;
  float newry=3700;
  x=lerp(x,newx,0.05);
  y=lerp(y,newy,0.05);
  z=lerp(z,newz,0.05);
  rx =lerp(rx,newrx,1);
  ry=lerp(ry,newry,1);
}

void cafe(){
  float newx=900;
  float newy=450;
  float newz=750;
  float newrx=-1400;
  float newry=3600;
  
  //float oldx=x;
  //float oldy=y;
  //float oldz=z;
  //float oldrx=rx;
  //float oldry=ry;
  
  x=lerp(x,newx,0.05);
  y=lerp(y,newy,0.05);
  z=lerp(z,newz,0.05);
  rx =lerp(rx,newrx,1);
  ry=lerp(ry,newry,1);
  
  println(x,y,z,rx,ry);
  
  //900.0006 450.0003 749.9994 -1399.0 3600.0
  //900.0006 449.9997 749.9994 -1400.0 3600.0
  
}

void graduate(){
  
  float newx=875;
  float newy=550;
  float newz=800;
  float newrx=1000;
  float newry=4200;
  
  x=lerp(x,newx,0.05);
  y=lerp(y,newy,0.05);
  z=lerp(z,newz,0.05);
  rx =lerp(rx,newrx,1);
  ry=lerp(ry,newry,1);
}

void keyPressed() {
  if (key == 'a') {
    x+=25;
    println(x,y,z);
  } else if (key == 'd'){
    x-=25;
    println(x,y,z);
  } else if (key == 'w'){
    y+=25;
    println(x,y,z);
  } else if (key == 's'){
    y-=25;
    println(x,y,z);
  } else if (key == 'k'){
    z-=25;
    println(x,y,z);
  } else if (key == 'l'){
    z+=25;
    println(x,y,z);
  }else if (key == 'y'){
    rx-=25;
    println(x,y,z);
  } else if (key == 'h'){
    rx+=25;
    println(x,y,z,rx,ry);
  }else if (key == 'u'){
    ry-=25;
    println(x,y,z);
  } else if (key == 'j'){
    ry+=25;
    println(x,y,z,rx,ry);
  }else if(key == '1'){
    zone = 1;
    //queens();
  }else if(key =='0'){
    zone = 0;
    //reset();
  }else if(key =='2'){
    zone = 2;
    //cafe();
  }else if(key =='3'){
    zone = 3;
    //graduate();
  }
}
