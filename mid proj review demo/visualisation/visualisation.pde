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
noStroke();
// set centre point
translate(width/2, height/2);

//flower 1 - queens
fill(255, 0, 255, flowerTransparency); 
ellipse(54, 235, 12, 12);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(54, 235, 5, 5);

//flower 2 - queens
fill(255, 0, 105, flowerTransparency); // green
ellipse(31, 240, 12, 12);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(31, 240, 5, 5);

//flower 3 - canal
fill(105, 0, 255, flowerTransparency); // green
ellipse(147, -190, 12, 12);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(147, -190, 5, 5);

//flower 4 - canal
fill(105, 0, 105, flowerTransparency); // green
ellipse(130, -206, 12, 12);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(130, -206, 5, 5);

//flower 5 - graduate
fill(259, 150, 105, flowerTransparency); // green
ellipse(-126, 170, 12,12);
fill(255, 255, 10, flowerTransparency); // light yellow
ellipse(-126, 170, 5, 5);

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
    screen1();
  }
}


//screen 1 - big map
void screen1(){
  flowers();
  num++;
  
  fill(200,200,200);
  textSize(50);
  fill(90,90,90);
  //text("FILTERS", 900, 50); 
  //columns
  fill(200,200,200);
  textSize(30);
  stroke(0);
  strokeWeight(2);
  fill(175, 200,200);
  rect(900, 30, 100, 45, 28);
  rect(1050, 30, 100, 45, 28);
  fill(250,240,150);
  rect(900, 80, 100, 45, 28);
  rect(1050, 80, 100, 45, 28);
  fill(150,205,150);
  rect(900, 130, 100, 45, 28);
  rect(1050, 130, 100, 45, 28);
  
  fill(90,90,90);
  text("Dry", 950, 60);
  text("Wet", 950, 110);
  text("Sunny", 950, 160);
  text("Shady", 1100, 60);
  text("Basic", 1100, 110);
  text("Alkaline", 1100, 160);
  
  //info box
  fill(90,90,90);
  noStroke();
  textSize(25);
  //textAlign(RIGHT);
  text("1. Select the filters to view the soil", 1050, 600);
  text("   conditions across campus", 1050, 630);
  text("2. Click a green area on campus to view it in", 1050, 660);
  text("   more detail", 1050, 690);
  text("3. Take a packet of seeds and plant in your", 1050, 720);
  text("   chosen area", 1050, 750);
  text("Help Re-wild Campus!", 1050, 780);
  
  
if (mousePressed&&mouseX>900&&mouseX<1000 && 75>mouseY&&mouseY>30) {
    stroke(0, 0);
    fill(255, 0, 0, 100);
    quad(508, 570, 545, 554,554, 566,519, 583);
    flowerTransparency -= 50;
  }else if (mousePressed&&mouseX>900&&mouseX<1000&&125>mouseY&&mouseY>80) {
    stroke(0, 0);
    fill(150, 0, 150, 100);
    quad(660, 644,707, 623,727, 639,666, 665);
    flowerTransparency -= 50;
  }else if(mousePressed&&mouseX>900&&mouseX<1000&&170>mouseY&&mouseY>130){
    stroke(0, 0);
    fill(230, 59, 150, 100);
    quad(772, 187,795, 220,809, 214,781, 185);
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
  text("a: queens building, b: canalside, c: graduate centre", width/2+110, height-90);
  text("press 'z' to age flowers by 10 days", width/2+110, height-60);
}

void drawBackButton(){
  fill(0,0,21,150);
  rect(0,0,150,40);
  fill(0,0,99); 
  text("back to map", 15,25);
  
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
  }
  
  
}
