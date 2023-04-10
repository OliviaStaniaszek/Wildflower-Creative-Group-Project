import processing.serial.*;
//background image
PImage ground;
//flower image
PImage both;
PImage sunny;
PImage none;
PImage water;

Serial mySerial;
int newLine = 10;
TableRow row;
Table test;
int moist = 0;
float sun = 0;

void setup() {
  fullScreen();
  //link processing to serial port
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
    //checking if value if null
    if (!(value == null)) {
      //trimming the String so it can be converted into an in
      value = value.trim();
      int a = int(value);
      //separating the moisture sensor value and the UV sensor value
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

    //depending on the value read by the arduino the healthiness of the flower changes
    if (moist > 400 && moist<600 && sun > 0 && sun < 1.5) {
      image(ground, 0, 0, width, height);
      println("water");
      image(water, 500, 300, 300, 300);
    } else if (moist > 0 && moist<300 && sun > 0 && sun < 1.5) {
      image(ground, 0, 0, width, height);
      println("none");
      image(none, 500, 300, 300, 300);
    } else if (moist > 400 && moist<600 && sun > 1.5) {
      image(ground, 0, 0, width, height);
      println("both");
      image(both, 500, 300, 300, 300);
    } else if (moist > 0 && moist<200 && sun > 1.5) {
      image(ground, 0, 0, width, height);
      println("sunny");
      image(sunny, 500, 300, 300, 300);
    }

    //prints the values in the csv file to ensure they are changing
    String moisture = row.getString("moisture");
    String sunlight = row.getString("sunlight");
    println(moisture + " " + sunlight);
    //delaying to add stability and time for the program to process
    delay(5000);
  }
}
