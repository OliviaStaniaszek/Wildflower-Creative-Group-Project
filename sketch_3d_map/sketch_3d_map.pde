/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen. 
 */
int value = 0;

//PShape map;
PShape buildings;
PShape green;
PShape water;
PShape floorplane;
PShape mapfloor;
PShape gradflowers;
PShape queenflowers;
PShape groundflowers;

//float ry;
// https://mrfeinberg.com/peasycam/#download 
import peasy.*;

PeasyCam cam;
//mouse left-drag will rotate the camera around the subject, 
//a right drag will zoom in and out, 
//and a middle-drag (command-left-drag on mac) will pan. 
//A double-click restores the camera to its original position. 
//The shift key constrains rotation and panning to one axis or the other. 

float x = 450;//500; //400; //width/2;
float y = 250;//150;//width/2;
float z = 100;//50;//-150;
float rx = -1350;//-650;//-450;
float ry = 3700;//3200;//0;

int zone; // reset queen cafe graduate
  
public void setup() {
  size(1300, 800, P3D);
  zone=0;
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(500);
  //stroke(0);
  //noFill();
  //noLoop();
    
  //map = loadShape("map.obj");
  buildings = loadShape("only buildings.obj");
  green = loadShape("green.obj");
  water = loadShape("water.obj");
  gradflowers = loadShape("gradflowers.obj");
  queenflowers = loadShape("queenflowers.obj");
  groundflowers = loadShape("groundflowers.obj");
  //floorplane = loadShape("floor plane.obj");
  mapfloor = loadShape("map floor.obj");
  //rotateZ(HALF_PI);
  //floorplane.setFill(color(251,245,232));
  mapfloor.setFill(color(98));
  green.setFill(color(41,152,55));
  buildings.setFill(color(200));
  water.setFill(color(96,135,175));
  gradflowers.setFill(#B829CB);
  queenflowers.setFill(#E81E1E);
  groundflowers.setFill(#EDDB11);
  perspective(PI/3.0,(float)width/height,1,100000); //clipping distance
  //strokeWeight(10);
  //buildings.setStroke(color(0));
  cam.setRotations(2.28, -0.62, 2.43); 

}

public void draw() {
  background(122,194,237);
  lights();
  //ambientLight(51, 102, 126);
  directionalLight(100, 100, 100, 0, -2, -1);
  
//  ambientLight(102, 102, 102);
//lightSpecular(204, 204, 204);
//directionalLight(102, 102, 102, 0, 0, -1);


  //translate(x, y, z);
  rotateZ(PI);
  rotateY(PI); //flip upsidedown
  ////rotateY(ry);
  //rotateX(rx);
  scale(-1.0, 1.0); //mirror across X-axis 
  //rotateY(ry);
  //shape(floorplane);
  shape(mapfloor);
  shape(buildings);
  shape(water);
  shape(green);
  shape(groundflowers);
  shape(gradflowers);
  shape(queenflowers);
  pushMatrix();

  popMatrix();
  
  //println(cam.getPosition());
  //float[] lookat = cam.getLookAt();  // float[] { x, y, z }, looked-at point
  //println(lookat);
  

  cam.beginHUD();
    // now draw things that you want relative to the camera's position and orientation
    fill(0,150);
    noStroke();
    rect(width-400,height-145,400,145);
    textSize(20);
    fill(255);
    
    //mouse left-drag will rotate the camera around the subject, 
    //a right drag will zoom in and out, 
    //and a middle-drag (command-left-drag on mac) will pan. 
    //A double-click restores the camera to its original position. 
    //The shift key constrains rotation and panning to one axis or the other. 
    text("left click drag to rotate camera", width-390, height-120);
    text("right click drag/ scroll wheel to zoom", width-390, height-95);
    text("middle drag to pan", width-390, height-70);
    text("double click to reset", width-390, height-45);
    text("shift key to rotate/pan on one axis", width-390, height-20);
  cam.endHUD();
    
    

  
  //if(zone==0){
  //  reset();
  //}else if(zone==1){
  //  queens();
  //}else if(zone==2){
  //  cafe();
  //}else if(zone==3){
  //  graduate();
  //}
  
  //ry += 0.02;
}


//void queens(){
//  //x= 500;
//  //y = 175;
//  //z = 300;
//  //rx = -1350;
//  //ry = 3650;
//  float newx=1000;
//  float newy=400;
//  float newz=700;
//  float newrx=-1400;
//  float newry=3650;
//  x=lerp(x,newx,0.05);
//  y=lerp(y,newy,0.05);
//  z=lerp(z,newz,0.05);
//  rx =lerp(rx,newrx,1);
//  ry=lerp(ry,newry,1);
//}

//void reset(){
//  //x = 450;
//  //y = 250;
//  //z = 100;
//  //rx = -1350;
//  //ry = 3650;
//  float newx=950;
//  float newy=500;
//  float newz=550;
//  float newrx=-1350;
//  float newry=3700;
//  x=lerp(x,newx,0.05);
//  y=lerp(y,newy,0.05);
//  z=lerp(z,newz,0.05);
//  rx =lerp(rx,newrx,1);
//  ry=lerp(ry,newry,1);
//}

//void cafe(){
//  float newx=900;
//  float newy=450;
//  float newz=750;
//  float newrx=-1400;
//  float newry=3600;
  
//  //float oldx=x;
//  //float oldy=y;
//  //float oldz=z;
//  //float oldrx=rx;
//  //float oldry=ry;
  
//  x=lerp(x,newx,0.05);
//  y=lerp(y,newy,0.05);
//  z=lerp(z,newz,0.05);
//  rx =lerp(rx,newrx,1);
//  ry=lerp(ry,newry,1);
  
//  println(x,y,z,rx,ry);
  
//  //900.0006 450.0003 749.9994 -1399.0 3600.0
//  //900.0006 449.9997 749.9994 -1400.0 3600.0
  
//}

//void graduate(){
//  float newx=875;
//  float newy=550;
//  float newz=800;
//  float newrx=1000;
//  float newry=4200;
  
//  x=lerp(x,newx,0.05);
//  y=lerp(y,newy,0.05);
//  z=lerp(z,newz,0.05);
//  rx =lerp(rx,newrx,1);
//  ry=lerp(ry,newry,1);
  
//  fill(255);
//  rect(width/2,height/2,20,40);
//}

//void keyPressed() {
//  if (key == 'a') {
//    x+=25;
//    println(x,y,z);
//  } else if (key == 'd'){
//    x-=25;
//    println(x,y,z);
//  } else if (key == 'w'){
//    y+=25;
//    println(x,y,z);
//  } else if (key == 's'){
//    y-=25;
//    println(x,y,z);
//  } else if (key == 'k'){
//    z-=25;
//    println(x,y,z);
//  } else if (key == 'l'){
//    z+=25;
//    println(x,y,z);
//  }else if (key == 'y'){
//    rx-=25;
//    println(x,y,z);
//  } else if (key == 'h'){
//    rx+=25;
//    println(x,y,z,rx,ry);
//  }else if (key == 'u'){
//    ry-=25;
//    println(x,y,z);
//  } else if (key == 'j'){
//    ry+=25;
//    println(x,y,z,rx,ry);
//  }else if(key == '1'){
//    zone = 1;
//    //queens();
//  }else if(key =='0'){
//    zone = 0;
//    //reset();
//  }else if(key =='2'){
//    zone = 2;
//    //cafe();
//  }else if(key =='3'){
//    zone = 3;
//    //graduate();
//  }
//}
