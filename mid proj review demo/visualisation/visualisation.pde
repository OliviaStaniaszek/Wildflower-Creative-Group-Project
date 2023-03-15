//map
PImage map;
int flowerX, flowerY;
int flowerTransparency = 255;
int screen = 1;
int num = 0;

//meadow
Table flowerTable;
Table zoneTable;

int noOfFlowers = 14; //hard coded
int noOfZones = 3; //hard coded
int currentZone = 0;
int keyval = 0;  //for keypress
Flower[] flowerAr = new Flower[noOfFlowers];
Zone[] zoneAr = new Zone[noOfZones];

void setup() {
  //map
  frameRate(12);
  size(1300, 800);
  background(0);
  map = loadImage("map.png");
  map.resize(1300, 800);
  image(map, 0, 0);
  textAlign(CENTER);
  loadFlowerTable();
  loadZoneTable();
}

void draw() {
  if(screen==1){
    screen1();
  }else if(screen==2){
    information();
  }else if(screen ==3){
    meadow(currentZone);
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
  colorMode(RGB);
  noStroke();
  // set centre point
  translate(width/2, height/2);
  //flower 1
  fill(255, 0, 255, flowerTransparency); 
  ellipse(104, 253, 10, 10);
  fill(255, 255, 10, flowerTransparency); // light yellow
  ellipse(104, 253, 5, 5);
  
  //flower 2
  fill(255, 0, 105, flowerTransparency); // green
  ellipse(151, 244, 10, 10);
  fill(255, 255, 10, flowerTransparency); // light yellow
  ellipse(151, 244, 5, 5);
  
  //flower 3
  fill(105, 0, 255, flowerTransparency); // green
  ellipse(241, -224, 10, 10);
  fill(255, 255, 10, flowerTransparency); // light yellow
  ellipse(241, -224, 5, 5);
  
  //flower 4
  fill(105, 0, 105, flowerTransparency); // green
  ellipse(260, -206, 10, 10);
  fill(255, 255, 10, flowerTransparency); // light yellow
  ellipse(260, -206, 5, 5);
  
  //flower 5
  fill(259, 150, 105, flowerTransparency); // green
  ellipse(-105, 179, 10, 10);
  fill(255, 255, 10, flowerTransparency); // light yellow
  ellipse(-105, 179, 5, 5);
  
  //translate back to (0,0) in top left corner
  translate(-width/2, -height/2);
}


//information page
void information(){
  colorMode(HSB, 360, 100, 100);
  stroke(0);
  //background(253);
  background(188,54,93);
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
    screen1();
  }
}


//screen 1 - big map
void screen1(){
  flowers();
  num++;
  fill(0);
  textSize(50);
  text("FILTERS", 100, 100);
  textSize(30);
  fill(255, 0, 0, 100);
  text("DRY", 150, 150);
  fill(150,0,150);
  text("WET", 150, 200);
  fill(150,0,150);
  text("SUNNY", 150, 250);
  fill(255);
  stroke(0);
  rect(1235, 750, 65, 50);
  fill(0);
  text("info", 1265, 785);
if (mousePressed&&mouseX>100&&mouseX<200&&150>mouseY&&mouseY>100) {
    stroke(0, 0);
    fill(255, 0, 0, 100);
    quad(536, 578, 582, 562,595, 573,547, 591);
    flowerTransparency -= 50;
  }else if (mousePressed&&mouseX>100&&mouseX<200&&200>mouseY&&mouseY>150) {
    stroke(0, 0);
    fill(150, 0, 150, 100);
    quad(732, 657, 798, 634, 826, 652, 741, 680);
    flowerTransparency -= 50;
  }else if(mousePressed&&mouseX>100&&mouseX<200&&250>mouseY&&mouseY>200){
    stroke(0, 0);
    fill(230, 59, 150, 100);
    quad(881, 171,913, 210,930, 202,894, 169);
    flowerTransparency -= 50;
  }else if (mousePressed&&mouseX>100&&mouseX<200&&100>mouseY&&mouseY>0) {
    image(map, 0, 0);
    flowerTransparency = 255;
  // very basic collision of cemetary
  }else if(mousePressed&&mouseX>825 && mouseX<1045 && mouseY>360 && mouseY<505){
    println("cemetary clickd");  
    screen = 3;
  }
}

void loadFlowerTable(){
  flowerTable = loadTable("packetsdata.csv", "header");
  int frows = flowerTable.getRowCount();
  //println(rows + " total rows in table");
  
  int [] packetID = new int[frows];
  int [] zonePlanted = new int[frows];
  String [] datePlanted = new String[frows];
  
  for(int i=0; i<flowerTable.getRowCount();i++){
    TableRow row = flowerTable.getRow(i);
    packetID[i] = row.getInt("packet");
    zonePlanted[i] = row.getInt("zone");
    datePlanted[i] = row.getString("date planted");
    flowerAr[i] = new Flower(packetID[i], zonePlanted[i], datePlanted[i]);
  }
}

void loadZoneTable(){
  zoneTable = loadTable("zonedata.csv", "header");
  int zrows = zoneTable.getRowCount();
  int [] zoneID = new int[zrows];
  String [] zoneName = new String[zrows];
  float [] ph = new float[zrows];
  float [] moisture = new float[zrows];
  float [] sunlight = new float[zrows];
  
  for(int i=0; i<zoneTable.getRowCount(); i++){
    TableRow row = zoneTable.getRow(i);
    zoneID[i] = row.getInt("zoneID");
    zoneName[i] = row.getString("name");
    ph[i] = row.getFloat("ph");
    moisture[i] = row.getFloat("moisture");
    sunlight[i] = row.getFloat("sunlight");
    zoneAr[i] = new Zone(zoneID[i], zoneName[i], ph[i], moisture[i], sunlight[i]);
  }
}

void drawHealthbars(){
  fill(0,0,21,150);
  rect(10,height-150, width/2, 140);
  int barMax = width/2-50;
  int barWidth = 10;
  int barStart = 30;
  textSize(20);
  
  zoneAr[currentZone].drawMoistureBar(barMax, barWidth, barStart);
  zoneAr[currentZone].drawPhBar(barMax, barWidth, barStart);
  zoneAr[currentZone].drawSunlightBar(barMax, barWidth, barStart);
}

void drawInfoBox(){
  fill(0,0,21,150);
  rect(width/2+100,height-150, width/2-110, 140);
  fill(0,0,99); 
  text("press a,b,c to change zone",width/2+110, height-120);
  //text("a: queens building, b: canalside, c: graduate centre", width/2+110, height-90);
  text("press 'z' to age flowers by 10 days", width/2+110, height-60);
}

void drawBackButton(){
  fill(0,0,21,150);
  rect(0,0,150,40);
  fill(0,0,99); 
  text("back to map", 15,25);
}

void drawInfoButton(){
  fill(0,0,21,150);
  rect(width-150,0,150,40);
  fill(0,0,99); 
  text("info", width-100,25);
}

//meadow
void meadow(int zone){
  colorMode(HSB, 360, 100, 100);
  background(188,54,93);
  noStroke();
  fill(123,80,50);
  rect(0,height*0.75, width, height);
  currentZone = zone;
  
  for (int i=0; i<flowerTable.getRowCount(); i++){
    flowerAr[i].drawFlower();
  }
  textAlign(LEFT);
  drawHealthbars();
  drawInfoBox();
  drawBackButton();
  drawInfoButton();
  textAlign(CENTER);
  
  if(keyPressed){
    println(key);
    if (key == 'a') {
    currentZone = 0;
    }else if(key == 'b'){
      currentZone = 1;
    }else if(key == 'c'){
      currentZone = 2;
    }else if(key == 'z'){
      for(int i=0; i<flowerTable.getRowCount();i++){
        flowerAr[i].increaseAge();
      }
    }
  }
  
  if(mousePressed&&mouseX<50&&mouseY<50&&screen!=1){
    println("back button pressed");
    screen = 1;
    screen1();
    image(map, 0, 0);
    colorMode(RGB, 255, 255, 255);
    flowerTransparency = 255;
  }else if(mousePressed&&mouseX<150&&mouseY<40){
    println("back button pressed");
    screen = 1;
    image(map, 0, 0);
    screen1();// not fully working?
  }else if(mousePressed&&mouseX>width-150&&mouseY<40){
    screen = 2;
    information();
  }
  
}
