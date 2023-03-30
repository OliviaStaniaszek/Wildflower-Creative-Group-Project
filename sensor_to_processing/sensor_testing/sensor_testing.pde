import processing.serial.*;

PImage ground;
PImage both;
PImage sunny;
PImage none;
PImage water;
Serial mySerial;
int newLine = 10;
int trial = 0;
TableRow row;
Table test;
int moist = 0;
float sun = 0;

void setup() {
  //link processing to serial port
  fullScreen();
  //size(600, 600);
  String myPort = Serial.list()[1];
  mySerial = new Serial(this, myPort, 9600);
  test = loadTable("test.csv", "header");
  ground = loadImage("ground.png");
  ground.resize(600, 600);
  both = loadImage("both.png");
  sunny = loadImage("sunny.png");
  none = loadImage("none.png");
  water = loadImage("water.png");
  image(ground, 0, 0, width, height);
}

void draw() {
  row = test.getRow(0);
  for (TableRow rows : test.rows()) {
    String value = mySerial.readStringUntil(newLine);
    if (!(value == null)) {
      value = value.trim();
      int a = int(value);
      if (a > 5) {
        moist = int(value);
        println("moist = " + moist);
        rows.setInt("moisture", moist);
      } else if (a > 0) {
        sun = int(value);
        rows.setFloat("sunlight", sun);
        println("sun = " + sun);
      }
    }

    if (moist > 400 && moist<600 && sun > 0 && sun < 1.5) {
      image(ground, 0, 0, width, height);
      println("water");
      image(water, 500, 300,300, 300);
    }else if(moist > 0 && moist<300 && sun > 0 && sun < 1.5) {
      image(ground, 0, 0, width, height);
      println("none");
      image(none, 500,300,300, 300);
    }else if(moist > 400 && moist<600 && sun > 1.5) {
      image(ground, 0, 0, width, height);
      println("both");
      image(both, 500, 300,300, 300);
    }else if(moist > 0 && moist<200 && sun > 1.5) {
      image(ground, 0, 0, width, height);
      println("sunny");
      image(sunny, 500, 300, 300, 300);
    }

    String moisture = row.getString("moisture");
    String sunlight = row.getString("sunlight");
    println(moisture + " " + sunlight);
    delay(5000);
    trial++;
  }
}
