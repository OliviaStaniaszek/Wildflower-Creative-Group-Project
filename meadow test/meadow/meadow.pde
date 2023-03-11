//meadow

Table flowerTable;
Table zoneTable;

int noOfFlowers = 14; //hard coded

Flower[] flowerAr = new Flower[noOfFlowers];

void setup(){
  noLoop();
  size(1300,800);
  colorMode(HSB, 360, 100, 100);
  background(188,54,93);
  noStroke();
  fill(123,80,50);
  rect(0,height*0.75, width, height);
  
  flowerTable = loadTable("packetsdata.csv", "header");
  int rows = flowerTable.getRowCount();
  //println(rows + " total rows in table");
  
  int [] packetID = new int[rows];
  int [] zonePlanted = new int[rows];
  String [] datePlanted = new String[rows];
  
  for(int i=0; i<flowerTable.getRowCount();i++){
    TableRow row = flowerTable.getRow(i);
    packetID[i] = row.getInt("packet");
    zonePlanted[i] = row.getInt("zone");
    datePlanted[i] = row.getString("date planted");
    
    flowerAr[i] = new Flower(packetID[i], zonePlanted[i], datePlanted[i]);
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
}
