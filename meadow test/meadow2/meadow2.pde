//meadow

class Flower{
  int age; //hard coded for now
  int zone; //zone planted in 
  int xpos;
  int ypos;
  int hue;
  
  //constructor
  Flower(int fdate, int fzone, int x, int y, int fhue){
    age = fdate;
    zone = fzone;
    xpos = x;
    ypos = y;
    hue = fhue;
  }
  
  //methods
  int getAge(){
    //get age of flower and return
    return age;
  }
  
  int getZone(){
    return zone;
  }
  
  void drawFlower(){
    stroke(119,76,81);
    strokeWeight(7);
    //line(xpos,ypos, xpos, ypos+60);
    int stemlength = int(map(age, 0, 365, 30,100));
    line(xpos,ypos, xpos, ypos+stemlength); //stem
    
    noStroke();
    
    fill(hue,63,91); //petal
    translate(xpos,ypos);
    
    int petalwidth = int(random(8,20));
    for(int i=0; i<12; i++){ //petals
      //ellipse(0+10, 0, 50, 10);
      ellipse(0+10, 0, 50, petalwidth);
      rotate(PI/6);
      //rotate(PI/4);
    }  
    fill(50,95,98); //yellow
    circle(0,0, 25);
    //translate(0,0);
    translate(-xpos,-ypos);
  }
  
}//end flower
int noOfFlowers = 10;
Flower[] flowers = new Flower[noOfFlowers];

void setup(){
  size(900,500);
  colorMode(HSB, 360, 100, 100);
  background(93,90,30);
 
  //initialise flowers
  for (int i = 0; i < flowers.length; i++){
    int randx = int(random(40,width-40)); 
    int randy = int(random(40,height-40));
    int randhue = int(random(179,354));
    int randage = int(random(365));
    
    
    println(i, randx,randy);
    flowers[i] = new Flower(randage, 1, randx, randy, randhue);
  }
  
  for (int i = 0; i < flowers.length; i++){
    flowers[i].drawFlower();
  }
  
}

void draw(){
  //run each flower
  
}
