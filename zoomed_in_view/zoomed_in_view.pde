
Zone queens;
Zone canalside;
Zone graduate;

Zone[] zones = {queens,canalside,graduate};

Table zoneTable;
int currentZone = 0;

PImage queensimg;
PImage graduateimg;
PImage canalimg;
PImage accomimg;

int keyval = 0;
//zone1 flowers
float w = 200;
float h = 400;
float[] one = {100,300,w,h,1};
float[] two = {350, 100, w, h, 0.75};
float[] three = {560, 250, w,h, 1.25};
float[] four = {845, 300, w,h, 1};
float[] five = {1100, 200, w,h, 0.7};
float[][] z1flowers = {one,two,three,four,five};

void setup(){
  size(1300,800);
  noStroke();
  //noLoop();
  background(47,118,41);
  queensimg = loadImage("queens.png");
  queensimg.resize(1300,800);
  graduateimg = loadImage("graduate.png");
  graduateimg.resize(1300,800);
  canalimg = loadImage("canalside.png");
  canalimg.resize(1300,800);
  accomimg = loadImage("accom.png");
  accomimg.resize(1300,800);

  
  //image(queensimg,0,0);
  
  
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
    zones[i] = new Zone(zoneID[i], zoneName[i], ph[i], moisture[i], sunlight[i], z1flowers);
  }
}

void draw(){
  background(47,118,41);
  if(keyPressed){
    println(key);
    if (key == 'a') {
    currentZone = 0;
    }else if(key == 'b'){
      currentZone = 1;
    }else if(key == 'c'){
      currentZone = 2;
    }
    println(currentZone);
  }
  backgroundimg();
  zones[0].drawFlowers();
  drawHealthbars();
  drawInfoBox();
  
  
    
  }

void backgroundimg(){
  if (currentZone == 0){
    image(queensimg,0,0);
  }else if(currentZone == 1){
    //image(canalimg,0,0);
    image(accomimg,0,0);
  }else if(currentZone == 2){
    image(graduateimg,0,0);
  }
}


void drawHealthbars(){
  fill(0,0,0,150);
  rect(10,height-150, width/2, 140);
  //int barMax = width/2-50;
  //int barWidth = 10;
  //int barStart = 30;
  int barMax = width/2-100;
  int barWidth = 10;
  int barStart = 150;
  textSize(20);
  
  zones[currentZone].drawMoistureBar(barMax, barWidth, barStart);
  zones[currentZone].drawPhBar(barMax, barWidth, barStart);
  zones[currentZone].drawSunlightBar(barMax, barWidth, barStart);
}

void drawInfoBox(){
  fill(0,0,0,150);
  rect(width/2+100,height-150, width/2-110, 140);
  fill(255); 
  text("press a,b,c to change zone",width/2+110, height-120);
  text("a: queens building, b: canalside, c: graduate centre", width/2+110, height-90);
  //text("press 'z' to age flowers by 10 days", width/2+110, height-60);

}
