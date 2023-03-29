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
//button transparency
int bt1 = 100;
int bt3 = 100;
int bt5 = 100;
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
  //size(1300, 800);
  fullScreen();
  background(0);
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
  loadFlowerTable();
  loadZoneTable();
  font = loadFont("data/Herculanum-48.vlw");
  textFont(font);
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
  } else if (screen == 3) {
    meadow(currentZone);
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
    text("Rewilding", 310, 320);
    text("Campus", 300, 450);
    
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

//COLLISIONS!!!!!!!!
void collisions(){
  if(mousePressed&&mouseX>593&&mouseX<648&&mouseY>626&&mouseY<660){
    println("GRADUATE");
 }else if(mousePressed&&mouseX>769&&mouseX<851&&mouseY>707&&mouseY<757){
    println("QUEENS");
  }else if(mousePressed&&mouseX>900&&mouseX<935&&mouseY>575&&mouseY<600){
    println("GROUND");
  }
}























  //FLOWERS
  void loadFlowerTable() {
    flowerTable = loadTable("packetsdata.csv", "header");
    int frows = flowerTable.getRowCount();
    //println(rows + " total rows in table");

    int [] packetID = new int[frows];
    int [] zonePlanted = new int[frows];
    String [] datePlanted = new String[frows];

    for (int i=0; i<flowerTable.getRowCount(); i++) {
      TableRow row = flowerTable.getRow(i);
      packetID[i] = row.getInt("packet");
      zonePlanted[i] = row.getInt("zone");
      datePlanted[i] = row.getString("date planted");
      flowerAr[i] = new Flower(packetID[i], zonePlanted[i], datePlanted[i]);
    }
  }

  void loadZoneTable() {
    zoneTable = loadTable("zonedata.csv", "header");
    int zrows = zoneTable.getRowCount();
    int [] zoneID = new int[zrows];
    String [] zoneName = new String[zrows];
    float [] ph = new float[zrows];
    float [] moisture = new float[zrows];
    float [] sunlight = new float[zrows];

    for (int i=0; i<zoneTable.getRowCount(); i++) {
      TableRow row = zoneTable.getRow(i);
      zoneID[i] = row.getInt("zoneID");
      zoneName[i] = row.getString("name");
      ph[i] = row.getFloat("ph");
      moisture[i] = row.getFloat("moisture");
      sunlight[i] = row.getFloat("sunlight");
      zoneAr[i] = new Zone(zoneID[i], zoneName[i], ph[i], moisture[i], sunlight[i]);
    }
  }

  void drawHealthbars() {
    fill(0, 0, 21, 150);
    rect(10, height-150, width/2, 140);
    int barMax = width/2-50;
    int barWidth = 10;
    int barStart = 30;
    textSize(20);

    zoneAr[currentZone].drawMoistureBar(barMax, barWidth, barStart);
    zoneAr[currentZone].drawPhBar(barMax, barWidth, barStart);
    zoneAr[currentZone].drawSunlightBar(barMax, barWidth, barStart);
  }

  void drawInfoBox() {
    fill(0, 0, 21, 150);
    rect(width/2+100, height-150, width/2-110, 140);
    fill(0, 0, 99);
    text("press a,b,c to change zone", width/2+110, height-120);
    text("a: queens building, b: canalside, c: graduate centre", width/2+110, height-90);
    text("press 'z' to age flowers by 10 days", width/2+110, height-60);
  }

  void drawBackButton() {
    fill(0, 0, 21, 150);
    rect(0, 0, 150, 40);
    fill(0, 0, 99);
    text("back to map", 15, 25);
  }

  //meadow
  void meadow(int zone) {
    colorMode(HSB, 360, 100, 100);
    background(188, 54, 93);
    noStroke();
    fill(123, 80, 50);
    rect(0, height*0.75, width, height);
    currentZone = zone;

    for (int i=0; i<flowerTable.getRowCount(); i++) {
      flowerAr[i].drawFlower();
    }
    textAlign(LEFT);
    drawHealthbars();
    drawInfoBox();
    drawBackButton();
    textAlign(CENTER);

    if (keyPressed) {
      println(key);
      if (key == 'a') {
        currentZone = 0;
      } else if (key == 'b') {
        currentZone = 1;
      } else if (key == 'c') {
        currentZone = 2;
      } else if (key == 'z') {
        for (int i=0; i<flowerTable.getRowCount(); i++) {
          flowerAr[i].increaseAge();
        }
      }
    }

    if (mousePressed&&mouseX<50&&mouseY<50&&screen!=1) {
      println("back button pressed");
      screen = 1;
      screen1();
      image(map, 0, 0);
      colorMode(RGB, 255, 255, 255);
      flowerTransparency = 255;
    }
  }
