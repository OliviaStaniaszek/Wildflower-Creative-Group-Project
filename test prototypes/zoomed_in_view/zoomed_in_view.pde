
Zone queens;
Zone canalside;
Zone graduate;

Zone[] zones = {queens,canalside,graduate};

Table zoneTable;
int currentZone = 0;

PFont timesNR;
PFont trebuchet;


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

int keyval = 0;
//zone1 flowers
float w = 200;
float h = 400;

int xadd = width - 1300;
int yadd = height - 800;
//println(xadd,yadd);


void setup(){
  //size(1300,800);
  size(1440,900);
  //fullScreen();
  noStroke();
  colorMode(RGB,255,255,255);
  //noLoop();
  background(47,118,41);
  timesNR = loadFont("TimesNewRoman.vlw");
  trebuchet = loadFont("TrebuchetMS-48.vlw");
  queensimg = loadImage("queens.png");
  graduateimg = loadImage("graduate.png");
  groundimg = loadImage("ground.png");
  //canalimg = loadImage("canalside.png");
  //accomimg = loadImage("accom.png");
  
  gradtall = loadImage("grad tall.png");
  gradshort = loadImage("grad short.png");
  
  queenstall = loadImage("queens tall.png");
  queensmid = loadImage("queens mid.png");
  queensshort = loadImage("queens short.png");
  
  

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
    float[][] flowerpos = getFlowerPos(i);
    zones[i] = new Zone(zoneID[i], zoneName[i], ph[i], moisture[i], sunlight[i], flowerpos);
  }
}

void draw(){
  background(47,118,41);
  if(keyPressed){
    //println(key);
    if (key == 'a') {
    currentZone = 0;
    }else if(key == 'b'){
      currentZone = 1;
    }else if(key == 'c'){
      currentZone = 2;
    }
    //println(currentZone);
  }
  zones[currentZone].backgroundimg();
  zones[currentZone].drawFlowers();
  drawHealthbars();
  drawInfoBox();
  drawTitleBox();
  }
  
void mouseClicked(){
  println(mouseX,mouseY);
}

void drawHealthbars(){
  fill(0,0,0,150);
  rect(10,height-150, width/2, 140);
  //int barMax = width/2-50;
  //int barWidth = 10;
  //int barStart = 30;
  int barMax = width/2-200;
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
  text("a: queens building, b: ground cafe, c: graduate centre", width/2+110, height-90);
  //text("press 'z' to age flowers by 10 days", width/2+110, height-60);
}

void drawTitleBox(){
  fill(0,0,0,150);
  rect(width/2-250,20,500,80);
  textAlign(CENTER);
  textFont(trebuchet, 40);
  fill(255,255,255);
  if(currentZone == 0){
    text("Queens Building", width/2,75);
  }else if(currentZone ==1){
    text("Ground Cafe", width/2,75);
  }else{
    text("Graduate Centre", width/2,75);
  }
}

float[][] getFlowerPos(int zone){
  if(zone == 0){
    float[] one = {150,300,w,h,1};
    float[] two = {260, 100, w, h, 0.75};
    float[] three = {320, 200, w,h, 1.25};
    float[] four = {520, 100, w,h, 1};
    float[] five = {950, 70, w,h, 0.8};
    float[][] z1flowers = {one,two,three,four,five};
    return z1flowers;
  }else if(zone ==1){
    float[] one = {100,350,w,h,1};
    float[] two = {380, 100, w, h, 0.75};
    float[] three = {420, 240, w,h, 1.25};
    float[] four = {670, 270, w,h, 1};
    float[] five = {850, 250, w,h, 0.7};
    float[][] z1flowers = {one,two,three,four,five};
    return z1flowers;
  }else{
    float[] one = {80,230,w,h,1};
    float[] two = {260, 150, w, h, 0.75};
    float[] three = {410, 150, w,h, 1.25};
    float[] four = {700, 200, w,h, 1};
    float[] five = {1100, 100, w,h, 0.7};
    float[][] z1flowers = {one,two,three,four,five};
    return z1flowers;
  }
  //return flowers
}
