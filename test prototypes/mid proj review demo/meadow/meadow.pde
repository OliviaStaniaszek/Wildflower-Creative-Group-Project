//meadow

Table flowerTable;
Table zoneTable;

int noOfFlowers = 14; //hard coded
int noOfZones = 3; //hard coded
int currentZone;

int keyval = 0;  //for keypress

Flower[] flowerAr = new Flower[noOfFlowers];
Zone[] zoneAr = new Zone[noOfZones];

void setup(){
  //noLoop();
  size(1300,800);
  colorMode(HSB, 360, 100, 100);
  background(188,54,93);
  noStroke();
  fill(123,80,50);
  rect(0,height*0.75, width, height);
  currentZone = 0;
  
  
  // load flower table
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
    zoneAr[i] = new Zone(zoneID[i], zoneName[i], ph[i], moisture[i], sunlight[i]);
  }
  
  
}

void draw(){
  background(188,54,93);
  noStroke();
  fill(123,80,50);
  rect(0,height*0.75, width, height);
  for (int i=0; i<flowerTable.getRowCount(); i++){
    flowerAr[i].drawFlower();
  }
  drawHealthbars();
  drawInfoBox();
  
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
