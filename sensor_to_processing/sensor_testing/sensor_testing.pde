Serial mySerial;
int newLine = 10;

void setup(){
  background(#FFFFFF);
  size(400,400);
  
  //link processing to serial port
  String myPort = Serial.list()[1];
  mySerial = new Serial(this, myPort, 9600);
}

void draw(){
  while(mySerial.available() > 0){
    background(#FFFFFF);
    String value = mySerial.readStringUntil(newLine); //STRIP
    
    if(value != null){
      //do whatever you need to do with the value
      //below I make a circle go big and small
      fill(0,0,float(value) / 1023 * 255);
      ellipse(float(width/2), float(height/2), float(value) / 1023 *width, float(value) / 1023 * width);
    }
  }
  print("oh no!");
  }
  
  
}
