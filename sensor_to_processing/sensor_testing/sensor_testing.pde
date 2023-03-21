import processing.serial.*;

Serial mySerial;
int newLine = 10;
int trial = 0;

//void setup(){
//  background(#FFFFFF);
//  size(400,400);
  
//  //link processing to serial port
//  String myPort = Serial.list()[2];
//  mySerial = new Serial(this, myPort, 9600);

//}

//void draw(){
//  while(mySerial.available() > 0){
//    background(#FFFFFF);
//    String value = mySerial.readStringUntil(newLine); //STRIP
//    //String value = mySerial.readString();
//    //print(value);
//    if(value != null){
//      //do whatever you need to do with the value
//      //below I make a circle go big and small
//      fill(0,0,0);
//      ellipse(float(width/2), float(height/2), float(value) / 1023 *width, float(value) / 1023 * width);
//    }
//  }
//  print("oh no!");
//  }
  
  
  
  
Table test;

void setup() {
  
  //link processing to serial port
  String myPort = Serial.list()[2];
  mySerial = new Serial(this, myPort, 9600);

  test = loadTable("test.csv", "header");
  

  //for (TableRow row : test.rows()) {
  //   String value = mySerial.readStringUntil(newLine); 
  //   if(value!= null){
  //   if(value.substring(0,1) == "M"){
  //     row.setString("moisture", value);
  //   }else if(value.substring(0,1) == "V"){
  //     row.setString("sunlight", value);
  //   }
  //   }
    
    //int id = row.getInt("zoneId");
    //String zone = row.getString("name");
    //String ph = row.getString("ph");
    //String moisture = row.getString("moisture");
    //String sunlight = row.getString("sunlight");

    //println(id+" "+zone+" "+ph+" "+moisture+" "+sunlight);
  }



void draw(){
  TableRow row = test.getRow(0);
  
  for (TableRow rows : test.rows()) {
     String value = mySerial.readStringUntil(newLine); 
     //if(value!= null){
       if(trial % 2 == 0){
         //println("MMMMM");
         rows.setString("moisture", value);
       }else{
         //println("VVVVV");
         rows.setString("sunlight", value);
       }
     //}
     //println(value);
    //int id = row.getInt("zoneId");
    //String zone = row.getString("name");
    String ph = row.getString("ph");
    String moisture = row.getString("moisture");
    String sunlight = row.getString("sunlight");
    //if(moisture!="20" && sunlight!="10"){
    println(ph+" "+moisture+" "+sunlight);
    //}
    delay(5000);
    trial++;
  }
}
