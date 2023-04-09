//meadow

class Flower{
  String date; //date planted ddmmyy
  int zone; //zone planted in 
  int xpos;
  int ypos;
  int hue;
  
  //constructor
  Flower(String fdate, int fzone, int x, int y, int fhue){
    date = fdate;
    zone = fzone;
    xpos = x;
    ypos = y;
    hue = fhue;
  }
  
  //methods
  void getAge(){
    //get age of flower and return
  }
  
  int getZone(){
    return zone;
  }
  
  void drawFlower(){
    stroke(119,76,81);
    strokeWeight(7);
    line(xpos,ypos, xpos, ypos+60);
    
    noStroke();
    
    fill(hue,63,91); //petal
    translate(xpos,ypos);
    
    for(int i=0; i<12; i++){ //petals
      ellipse(0+10, 0, 50, 10);
      rotate(PI/4);
    }  
    //ellipse(xpos,ypos, 
    fill(50,95,98); //yellow
    circle(0,0, 25);
    translate(0,0);
  }
  
}//end flower

Flower[] flowers = new Flower[10];

void setup(){
  size(900,500);
  colorMode(HSB, 360, 100, 100);
  background(93,74,56);
 
  //initialise flowers
  for (int i = 0; i < flowers.length; i++){
    int randx = int(random(0,900)); 
    int randy = int(random(0,500));
    int randhue = int(random(179,354));
    println(i, randx,randy);
    flowers[i] = new Flower("000000", 1, randx, randy, randhue);
  }
  
  for (int i = 0; i < flowers.length; i++){
    flowers[i].drawFlower();
  }
  
}

void draw(){
  //run each flower
  
}
