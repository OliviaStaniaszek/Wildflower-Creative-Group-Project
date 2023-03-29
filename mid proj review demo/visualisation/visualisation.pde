//map
PImage map;
PImage dryMap;
PImage sunnyMap;
PImage basicMap;
int flowerX, flowerY;
int flowerTransparency = 255;
int screen = 1;
int num = 0;
PFont font;
PFont trebuchet;
PFont title;
//button transparency
int bt1 = 100;
int bt3 = 100;
int bt5 = 100;
//meadow
//Table flowerTable;
Table zoneTable;
//int noOfFlowers = 14; //hard coded
int noOfZones = 3; //hard coded
int currentZone = 0;
//int keyval = 0;  //for keypress
//Flower[] flowerAr = new Flower[noOfFlowers];
Zone[] zoneAr = new Zone[noOfZones];

//zoomed in view
Zone queens;
Zone canalside;
Zone graduate;

Zone[] zones = {queens,canalside,graduate};


//bkgs
PImage queensimg;
PImage graduateimg;
PImage groundimg;
//PImage canalimg;
//PImage accomimg;

//flowers
PImage gradtall;
PImage gradshort;
PImage queenstall;
PImage queensmid;
PImage queensshort;
PImage ground;

int keyval = 0;
//zone1 flowers
float w = 200;
float h = 400;


void setup() {
  //map
  frameRate(12);
  //size(1300, 800);
  //fullScreen();
  size(1440,900); //kamryn screen size
  background(0);
  //map
  map = loadImage("map.png");
  map.resize(width, height);
  dryMap = loadImage("dry.png");
  dryMap.resize(width, height);
  sunnyMap = loadImage("sunny.png");
  sunnyMap.resize(width, height);
  basicMap = loadImage("basic.png");
  basicMap.resize(width, height);
  image(map, 0, 0);
  textAlign(CENTER);
  //loadFlowerTable();
  //loadZoneTable();
  font = loadFont("data/Herculanum-48.vlw");
  trebuchet = loadFont("TrebuchetMS-48.vlw");
  title = loadFont("TrebuchetMS-120.vlw");
  textFont(trebuchet);
  
  //zoomed in
  queensimg = loadImage("queens.png");
  graduateimg = loadImage("graduate.png");
  groundimg = loadImage("ground.png");
  gradtall = loadImage("grad tall.png");
  gradshort = loadImage("grad short.png");
  queenstall = loadImage("queens tall.png");
  queensmid = loadImage("queens mid.png");
  queensshort = loadImage("queens short.png");
  ground = loadImage("ground cafe open crumpled.png");
  //load zone table
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
    float[][] flowerpos = getFlowerPos(i);
    zones[i] = new Zone(zoneID[i], zoneName[i], ph[i], moisture[i], sunlight[i], flowerpos);
  }
}

void draw() {
  collisions();
  if (screen == 1) {
    screen1();
  } else if (screen==2) {
    //dry filtered screen
    screen2();
  } else if (screen==4) {
    //sunny filtered screen
    screen4();
  } else if (screen==5) {
    //basic filtered screen
    screen5();
  } else if (screen == 6) {
    drawZone(0);
  } else if (screen == 7) {
    drawZone(1);
  } else if (screen == 8) {
    drawZone(2);
  }else if (screen == 9) {
    drawConfirm();
  }
  
  //debug
  if (mousePressed) {
    println(mouseX + " : " + mouseY);
  }
  if (screen==1||screen==2||screen==4||screen==5) {
    if (mousePressed&&mouseX >= 1060 && mouseX <= 1200) {
      if (mouseY >= 30 && mouseY <= 70) {
        bt5 = 100;
        bt3 = 100;
        bt1 = 255;
        screen=2;
      } else if (mouseY >= 100 && mouseY <= 140) {
        bt1 = 100;
        bt5 = 100;
        bt3 = 255;
        screen=4;
      } else if (mouseY >= 165 && mouseY <= 215) {
        bt1 = 100;
        bt3 = 100;
        bt5 = 255;
        screen=5;
      }
    }else if(mousePressed){
      screen=1;
      bt1 = bt3 = bt5 = 100;
    }
  }
}


  //draw flowers on map
  void flowers() {
    noStroke();
    //flower 1 - queens
    fill(255, 0, 255, flowerTransparency);
    ellipse(787, 734, 12, 12);
    fill(255, 255, 10, flowerTransparency); // light yellow
    ellipse(787, 734, 5, 5);
    
    //flower 2 - queens
    fill(255, 0, 105, flowerTransparency); // green
    ellipse(804, 721, 12, 12);
    fill(255, 255, 10, flowerTransparency); // light yellow
    ellipse(804, 721, 5, 5);

    //flower 3 - Ground
    fill(105, 0, 255, flowerTransparency); // green
    ellipse(913, 581, 12, 12);
    fill(255, 255, 10, flowerTransparency); // light yellow
    ellipse(913, 581, 5, 5);

    //flower 4 - Ground
    fill(105, 0, 105, flowerTransparency); // green
    ellipse(915, 591, 12, 12);
    fill(255, 255, 10, flowerTransparency); // light yellow
    ellipse(915, 591, 5, 5);

    //flower 5 - graduate
    fill(259, 150, 105, flowerTransparency); // green
    ellipse(620, 642, 12, 12);
    fill(255, 255, 10, flowerTransparency); // light yellow
    ellipse(620, 642, 5, 5);
  }

  //screen 1 - big map
  void screen1() {
    image(map, 0, 0);
    flowers();
    num++;
    mapInfoBox();
    filters();
     if (mousePressed&&mouseX>825 && mouseX<1045 && mouseY>360 && mouseY<505) {
      // very basic collision of cemetary
      println("cemetary clicked");
      screen = 3;
    } 
  }

  void mapInfoBox() {
    //info box
    fill(90, 90, 90);
    noStroke();
    textSize(23);
    textAlign(LEFT);
    text("1. Select the filters to view the soil", 1000, 700);
    text("   conditions across campus", 1000, 730);
    text("2. Click a green area on campus to ", 1000, 760);
    text("   view it in more detail", 1000, 790);
    text("3. Take a packet of seeds and plant", 1000, 820);
    text("   in your chosen area", 1000, 850);
    textSize(120);
    textAlign(CENTER);
    textFont(title);
    text("Rewilding", 310, 320);
    text("Campus", 300, 450);
    textFont(trebuchet);
    
  }

  void filters() {
    //columns
    fill(200, 200, 200);
    textSize(30);
    stroke(0);
    strokeWeight(2);
    //Dry
    fill(94, 163, 179, bt1);
    rect(1055, 30, 150, 45, 28);
    //Wet
    fill(94, 163, 179, 100);
    rect(1230, 30, 150, 45, 28);
    //Sunny
    fill(255, 165, 0, bt3);
    rect(1055, 95, 150, 45, 28);
    //Shady
    fill(255, 165, 0, 100);
    rect(1230, 95, 150, 45, 28);
    //Basic
    fill(124, 252, 0, bt5);
    rect(1055, 165, 150, 45, 28);
    //Acidic
    fill(124, 252, 0, 100);
    rect(1230, 165, 150, 45, 28);

    fill(90, 90, 90);
    text("Dry", 1125, 60);
    text("Sunny", 1125, 125);
    text("Basic", 1125, 197);
    text("Wet", 1305, 60);
    text("Shady", 1305, 125);
    text("Acidic", 1305, 197);
  }

  //filtered when dry is pressed
  void screen2() {
    image(dryMap, 0, 0);
    flowers();
    num++;
    mapInfoBox();
    filters();
  }

  //filtered when sunny is pressed
  void screen4() {
    image(sunnyMap, 0, 0);
    flowers();
    num++;
    mapInfoBox();
    filters();
  }

  //filtered when basic is pressed
  void screen5() {
    image(basicMap, 0, 0);
    flowers();
    num++;
    mapInfoBox();
    filters();
  }
  
  void drawZone(int zone){
    println("zone", zone);
    zones[zone].backgroundimg(zone);
    zones[zone].drawFlowers(zone);
    drawHealthbars(zone);
    //drawInfoBox();
    drawTitleBox(zone);
    drawBackButton();
    drawConfirmButton();
  }
  
  void drawConfirm(){
    background(247,235,205);
    drawBackButton();
    textAlign(CENTER);
    fill(90);
    text("please take a packet of seeds and plant it in your chosen area",width/2,height/2);
  }
  
  

//COLLISIONS!!!!!!!!
void collisions(){
  if(mousePressed&&mouseX>593&&mouseX<648&&mouseY>626&&mouseY<660){
    println("GRADUATE");
    screen = 8;
    drawZone(1);
 }else if(mousePressed&&mouseX>769&&mouseX<851&&mouseY>707&&mouseY<757){
    println("QUEENS");
    screen = 6;
    drawZone(0);
  }else if(mousePressed&&mouseX>900&&mouseX<935&&mouseY>575&&mouseY<600){
    println("GROUND");
    screen = 7;
    drawZone(1);
  }else if(mousePressed&& mouseX<150 && mouseY<40){ //back button
    screen = 1;
  }else if(mousePressed&& mouseX>width-200 && mouseY>height-50){ //plant seeds button
    screen = 9;
  }
}

float[][] getFlowerPos(int zone){
  if(zone == 0){
    float[] one = {150,300,w,h,1};
    float[] two = {340, 150, w, h, 0.75};
    float[] three = {400, 250, w,h, 1.25};
    float[] four = {620, 150, w,h, 1};
    float[] five = {950, 120, w,h, 0.8};
    float[][] z1flowers = {one,two,three,four,five};
    return z1flowers;
  }else if(zone ==1){
    float[] one = {400,300, w,h,0.9};
    float[] two = {550, 200, w, h, 0.65};
    float[] three = {570, 420, w,h, 1};
    float[] four = {740, 270, w,h, 0.9};
    float[] five = {950, 380, w,h, 0.7};
    float[][] z1flowers = {one,two,three,four,five};
    return z1flowers;
  }else{
    float[] one = {80,280,w,h,1};
    float[] two = {300, 200, w, h, 0.75};
    float[] three = {490, 200, w,h, 1.25};
    float[] four = {850, 250, w,h, 1};
    float[] five = {1250, 100, w,h, 0.7};
    float[][] z1flowers = {one,two,three,four,five};
    return z1flowers;
  }
  //return flowers
}





void drawHealthbars(int zone){
  fill(0,0,0,150);
  noStroke();
  rect(10,height-150, width/2, 140);
  //int barMax = width/2-50;
  //int barWidth = 10;
  //int barStart = 30;
  int barMax = width/2-200;
  int barWidth = 10;
  int barStart = 150;
  textSize(20);
  
  zones[zone].drawMoistureBar(barMax, barWidth, barStart);
  zones[zone].drawPhBar(barMax, barWidth, barStart);
  zones[zone].drawSunlightBar(barMax, barWidth, barStart);
}

void drawInfoBox(){
  fill(0,0,0,150);
  noStroke();
  rect(width/2+100,height-150, width/2-110, 140);
  fill(255); 
  
  //text("press a,b,c to change zone",width/2+110, height-120);
  //text("a: queens building, b: ground cafe, c: graduate centre", width/2+110, height-90);
  //text("press 'z' to age flowers by 10 days", width/2+110, height-60);
}
  
  void drawTitleBox(int zone){
    fill(0,0,0,150);
    noStroke();
    rect(width/2-250,20,500,80);
    textAlign(CENTER);
    textFont(trebuchet, 40);
    fill(255,255,255);
    if(zone == 0){
      text("Queens Building", width/2,75);
    }else if(zone == 1){
      text("Ground Cafe", width/2,75);
    }else{
      text("Graduate Centre", width/2,75);
    }
  }

  void drawBackButton() {
    noStroke();
    textAlign(LEFT);
    fill(0,0,0,150);
    rect(0, 0, 150, 40);
    fill(255,255,255);
    textSize(20);
    text("back to map", 15, 25);
  }
  
  void drawConfirmButton() {
    noStroke();
    textAlign(LEFT);
    fill(0,0,0,150);
    rect(width-200, height-50, 200, 50);
    fill(255,255,255);
    textSize(25);
    text("Plant here", width-170, height-18);
  }
