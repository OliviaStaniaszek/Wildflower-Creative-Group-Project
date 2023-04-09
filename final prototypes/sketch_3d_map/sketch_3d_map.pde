
// create PHshape objects
PShape buildings;
PShape green;
PShape water;
PShape mapfloor;
PShape gradflowers;
PShape queenflowers;
PShape groundflowers;

// peasycam library for moving camera easily
import peasy.*;
PeasyCam cam;
  
public void setup() {
  size(1300, 800, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(500);

  // load objects
  buildings = loadShape("only buildings.obj");
  green = loadShape("green.obj");
  water = loadShape("water.obj");
  gradflowers = loadShape("gradflowers.obj");
  queenflowers = loadShape("queenflowers.obj");
  groundflowers = loadShape("groundflowers.obj");
  mapfloor = loadShape("map floor.obj");

  // colour objects
  mapfloor.setFill(color(98));
  green.setFill(color(41,152,55));
  buildings.setFill(color(200));
  water.setFill(color(96,135,175));
  gradflowers.setFill(#B829CB);
  queenflowers.setFill(#E81E1E);
  groundflowers.setFill(#EDDB11);

  // clipping distance
  perspective(PI/3.0,(float)width/height,1,100000); 

  //set camera starting position
  cam.setRotations(2.28, -0.62, 2.43); 

}

public void draw() {
  background(122,194,237);

  lights();
  directionalLight(100, 100, 100, 0, -2, -1);

  // rotate map to correct position
  rotateZ(PI);
  rotateY(PI); //flip upsidedown
  scale(-1.0, 1.0); //mirror across X-axis 

  // draw shapes
  shape(mapfloor);
  shape(buildings);
  shape(water);
  shape(green);
  shape(groundflowers);
  shape(gradflowers);
  shape(queenflowers);
  pushMatrix();
  popMatrix();
  
  // draw things relative to camera position - HUD/ UI
  cam.beginHUD();
    fill(0,150);
    noStroke();
    rect(width-400,height-145,400,145);
    textSize(20);
    fill(255);
    
    text("left click drag to rotate camera", width-390, height-120);
    text("right click drag/ scroll wheel to zoom", width-390, height-95);
    text("middle drag to pan", width-390, height-70);
    text("double click to reset", width-390, height-45);
    text("shift key to rotate/pan on one axis", width-390, height-20);
  cam.endHUD();
}

