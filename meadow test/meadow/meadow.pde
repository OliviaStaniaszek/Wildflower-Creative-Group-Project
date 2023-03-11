//meadow

Table flowerTable;
Table zoneTable;

int noOfFlowers = 14; //hard coded
int noOfZones = 3; //hard coded
int currentZone;

Flower[] flowerAr = new Flower[noOfFlowers];
Zone[] zoneAr = new Zone[noOfZones];

void setup(){
  noLoop();
  size(1300,800);
  colorMode(HSB, 360, 100, 100);
  background(188,54,93);
  noStroke();
  fill(123,80,50);
  rect(0,height*0.75, width, height);
  currentZone = 1;
  
  
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
  
 
  //initialise flowers
  //for (int i = 0; i < flowers.length; i++){
  //  int randhue = int(random(210,354));
  //  int randage = int(random(365));
  //  int x = int(map(i, 0,flowers.length-1, 40, width-40));
  //  int stemlength = int(map(randage, 0, 365, 30,100));
  //  int y = int(height*0.75 - stemlength);
  //  println(i, x,y);
  //  flowers[i] = new Flower(randage, 1, x, y, randhue);
  //}
  
  //for (int i = 0; i < flowers.length; i++){
  //  flowers[i].drawFlower();
  //}
  
}

void draw(){
  for (int i=0; i<flowerTable.getRowCount(); i++){
    flowerAr[i].drawFlower();
  }
  drawHealthbars();
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
