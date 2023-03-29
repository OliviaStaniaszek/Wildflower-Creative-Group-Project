/* 
  AnalogReadSerial
  Reads an analog input on pin -, prints the result to the Serial Monitor. 
  Graphical representation is available using Serial Plotter (Tools > Serial Plotter menu)
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.
  This example code is in the public domain
  https://www.arduino.cc/en/Tutorial/BuiltInExamples/AnalogReadSerial
*/
//the setup routine runs once when you press reset
void setup() {
  //initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}
//the loop routine runs over and over again forever:
void loop() {
  int sensorValue = analogRead(A0);
  //equation to make value of uv sensor more readable
  float voltage = sensorValue *(5.0/1023.0);
  //prints soil moisture sensor value then uv sensor value
  Serial.println(analogRead(A1));
  Serial.println(voltage);
  //delay 5 seconds to allow stablity and time to change
  delay(5000);  
}
