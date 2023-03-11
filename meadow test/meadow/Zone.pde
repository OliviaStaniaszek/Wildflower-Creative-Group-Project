class Zone{
  int id;
  String name;
  float ph;
  float moisture;
  float sunlight;
  
  
  Zone(int zid, String zname, float zph, float zmoisture, float zsunlight){
    id = zid;
    name = zname;
    ph = zph;
    moisture = zmoisture;
    sunlight = zsunlight;
    println(id,name,ph,moisture,sunlight);
  }
  
  
  //methods
  float getPh(){
    return ph;
  }
  
  float getMoisture(){
    return moisture;
  }
  
  float getSunlight(){
    return sunlight;
  }
  
  void drawMoistureBar(int barMax, int barWidth, int barStart){
    fill(206,60,96); //blue
    float moistbarLength = map(moisture, 0, 100, 0, barMax);
    rect(barStart, height - 130, moistbarLength, barWidth);
    text("Soil moisture",30, height - 30);
  }
  
  void drawPhBar(int barMax, int barWidth, int barStart){
    fill(124,60,96); //green
    float phbarLength = map(ph, 0, 14, 0, barMax);
    rect(barStart, height - 100, phbarLength, barWidth);
    text("Soil pH",200, height - 30);
  }
  
  void drawSunlightBar(int barMax, int barWidth, int barStart){
    fill(48,60,96); //yellow
    float sunbarLength = map(sunlight, 0, 12, 0, barMax);
    rect(barStart, height - 70, sunbarLength, barWidth);
    text("Sunlight",320, height - 30);
  }
}
