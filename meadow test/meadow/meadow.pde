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
    int stemlength = int(map(age, 0, 365, 30,100));
    line(xpos,ypos, xpos, ypos+stemlength); //stem
    
    noStroke();
    
    fill(hue,63,91); //petal
    translate(xpos,ypos);
    int petalwidth = int(random(8,20));
    for(int i=0; i<12; i++){ //petals
      ellipse(0+10, 0, 50, petalwidth);
      rotate(PI/6);
    }  
    fill(50,95,98); //yellow
    circle(0,0, 25);
    translate(-xpos,-ypos);
  }
  
}//end flower

int noOfFlowers = 10;
Flower[] flowers = new Flower[noOfFlowers];

void setup(){
  size(900,500);
  colorMode(HSB, 360, 100, 100);
  background(188,54,93);
  noStroke();
  fill(123,80,50);
  rect(0,height*0.75, width, height);
  
 
  //initialise flowers
  for (int i = 0; i < flowers.length; i++){
    
    //int age = flowers[i].age;
    
    //int y = int(height*0.75);
    int randhue = int(random(210,354));
    int randage = int(random(365));
    
    int x = int(map(i, 0,flowers.length-1, 40, width-40));
    int stemlength = int(map(randage, 0, 365, 30,100));
    int y = int(height*0.75 - stemlength);
    println(i, x,y);
    flowers[i] = new Flower(randage, 1, x, y, randhue);
  }
  
  for (int i = 0; i < flowers.length; i++){
    flowers[i].drawFlower();
  }
  
}

void draw(){
  
}
