
PShape buildings;
PShape green;
PShape water;
PShape floorplane;
PShape mapfloor;
PShape gradflowers;
PShape queenflowers;
PShape groundflowers;


//import peasy.*;

//PeasyCam cam;

import processing.opengl.*;
float distance = 500;

void setup() {
  //cam = new PeasyCam(this, 0, 0, 0, 500);
  //cam.setMinimumDistance(0);
  //cam.setMaximumDistance(350);
  
  size(1500,1000,OPENGL);
  perspective(PI/3.0, width/height,1,100000);
  strokeWeight(5);
  stroke(255);
  buildings = loadShape("only buildings.obj");
  green = loadShape("green.obj");
  water = loadShape("water.obj");
  gradflowers = loadShape("gradflowers.obj");
  queenflowers = loadShape("queenflowers.obj");
  groundflowers = loadShape("groundflowers.obj");
  //floorplane = loadShape("floor plane.obj");
  mapfloor = loadShape("map floor.obj");
    mapfloor.setFill(color(98));
  green.setFill(color(41,152,55));
  buildings.setFill(color(200));
  water.setFill(color(96,135,175));
  gradflowers.setFill(#B829CB);
  queenflowers.setFill(#E81E1E);
  groundflowers.setFill(#EDDB11);
  
}

void draw() {
  background(122,194,237);
  lights();
  directionalLight(100, 100, 100, 0, -2, -1);

  
  float x = cos(0.025*frameCount) * distance;
  float y = -distance;
  //float y = sin(0.05*frameCount) * distance;
  float z = sin(0.025*frameCount) * distance;
  camera(x,y,z, 0,0,0, 0,3,0);  
  fill(255,0,0);
  
  rotateZ(PI);
  rotateY(PI); //flip upsidedown
  ////rotateY(ry);
  //rotateX(rx);
  scale(-1.0, 1.0); //mirror across X-axis 

  shape(mapfloor);
  shape(buildings);
  shape(water);
  shape(green);
  shape(groundflowers);
  shape(gradflowers);
  shape(queenflowers);
}
