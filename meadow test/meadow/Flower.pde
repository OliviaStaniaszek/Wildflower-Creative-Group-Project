class Flower{
  //new Flower(packetID[i], zonePlanted[i], datePlanted[i]);
  int id;
  String datePlanted;
  int zone; //zone planted in 
  int age;
  int xpos;
  int ypos;
  int hue;
  
  //constructor
  Flower(int fid, int fzone, String fdate){
    id = fid;
    zone = fzone;
    datePlanted = fdate; 
    int[] date = int(split(datePlanted, '/')); 
    println(date[0],date[1],date[2]); //day month year
    
    //random values for now
    age = int(random(365)); 
    xpos = int(map(id, 0, 14-1, 40, width-40)); //14 = no of flowers
    int stemlength = int(map(age, 0, 365, 30,100));
    ypos = int(height*0.75 - stemlength);
    hue = int(random(200,354)); 
  }
  
  //methods
  //int getAge(){
  //  //get age of flower and return
  //  //return age;
  //}
  
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
  
  void increaseAge(){
    age += 10;
    drawFlower();
  }
  
}//end flower
