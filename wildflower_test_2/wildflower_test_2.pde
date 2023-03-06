PImage map;
int flowerTransparency = 255;
int screen = 1;
void setup() {
  frameRate(12);
  size(1300, 800);
  background(0);
  map = loadImage("map.png");
  map.resize(1300, 800);
  image(map, 0, 0);
  textAlign(CENTER);
}

void draw() {
  if(screen==1){
    screen1();
  }else if(screen==2){
    information();
  }
  //check if info screen is clicked
  if (mousePressed&&mouseX>1235&&mouseX<1300&&mouseY>750&&mouseY<800) {
    screen = 2;
  }
  
  //debug
  if (mousePressed) {
    println(mouseX + " : " + mouseY);
  }
}


//draw flowers on map
void flowers(){
noStroke();
// set centre point
translate(width/2, height/2);
//flower 1
fill(255, 0, 255, flowerTransparency); // green
ellipse(150, 0, 10, 10);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(150, 0, 5, 5);

//flower 2
fill(255, 0, 105, flowerTransparency); // green
ellipse(270, 50, 10, 10);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(270, 50, 5, 5);

//flower 3
fill(105, 0, 255, flowerTransparency); // green
ellipse(50, 230, 10, 10);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(50, 230, 5, 5);

//flower 4
fill(105, 0, 105, flowerTransparency); // green
ellipse(30, 245, 10, 10);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(30, 245, 5, 5);

//translate back to (0,0) in top left corner
translate(-width/2, -height/2);
}


//information page
void information(){
  stroke(0);
  background(253);
  fill(253);
  rect(0, 0, 50, 50);
  fill(0);
  textSize(20);
  text("back", 25, 25);
  textSize(100);
  text("Information", width/2, 100);
  if(mousePressed&&mouseX<50&&mouseY<50){
    screen = 1;
    image(map, 0, 0);
  }
}


//screen 1 - big map
void screen1(){
  flowers();
  fill(0);
  textSize(50);
  text("FILTERS", 100, 100);
  textSize(30);
  fill(255, 0, 0, 100);
  text("DRY", 150, 150);
  fill(150,0,150);
  text("WET", 150, 200);
  fill(255);
  stroke(0);
  rect(1235, 750, 65, 50);
  fill(0);
  text("info", 1265, 785);
if (mousePressed&&mouseX>100&&mouseX<200&&150>mouseY&&mouseY>100) {
    stroke(0, 0);
    fill(255, 0, 0, 100);
    quad(741, 391, 923, 497, 971, 455, 803, 355);
    flowerTransparency -= 50;
  }else if (mousePressed&&mouseX>100&&mouseX<200&&250>mouseY&&mouseY>150) {
    stroke(0, 0);
    fill(150, 0, 150, 100);
    quad(659, 637, 725, 619, 749, 636, 666, 661);
    flowerTransparency -= 50;
  }else if (mousePressed&&mouseX>100&&mouseX<200&&100>mouseY&&mouseY>0) {
    image(map, 0, 0);
    flowerTransparency = 255;
  }
}
