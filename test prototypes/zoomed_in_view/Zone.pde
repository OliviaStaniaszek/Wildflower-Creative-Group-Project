class Zone{
  int id;
  String name;
  float ph;
  float moisture;
  float sunlight;
  float[] flower1 = new float[3]; //x y scale
  float[] flower2 = new float[3];
  float[] flower3 = new float[3];
  float[] flower4 = new float[3];
  float[] flower5 = new float[3];
  float flowerW = 200;
  
  float[][] flowers = {flower1,flower2,flower3,flower4,flower5};
  
  Zone(int zid, String zname, float zph, float zmoisture, float zsunlight, float[][] zflowers){
    id = zid;
    name = zname;
    ph = zph;
    moisture = zmoisture;
    sunlight = zsunlight;
    flowers = zflowers;
    //println(id,name,ph,moisture,sunlight);
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
  
  void drawFlowers(){
    for(int flower=0; flower< 5; flower++){
      //println(flowers[flower]);
      //colorMode(HSB,365, 100,100);
      //fill(flower*70,74,82,200);
      //x y w scale
      float x = flowers[flower][0];
      float y = flowers[flower][1];
      float w = flowers[flower][2];
      float h = flowers[flower][3]; //height is double width
      float s = flowers[flower][4];
      //gradtall.resize(int(w*s),int(h*s));
      
      if(id == 1){ //queens
        //println(flower);
        if(flower == 0 || flower == 3){
          image(queenstall,x,y,w*s,h*s);
        }else if(flower == 1|| flower == 4){
          image(queensmid,x,y,w*s,h*s);
        }else{
          image(queensshort,x,y,w*s,h*s);
        }
         //accom/cafe
      }else if(id ==2){
        image(queensmid,x,y,w*s,h*s);
       //graduate
      }else if(id == 3){
        //image(gradshort,x,y,w*s,h*s); 
        if(flower % 2 == 0){
          image(gradtall,x,y,w*s,h*s); 
        }else{
          image(gradshort,x,y,w*s,h*s); 
        }
      }
      
    }
  }
  void backgroundimg(){
    textAlign(CENTER);
    textSize(40);
    fill(255,255,255);
    if (currentZone == 0){
      image(queensimg,0,0,width,height);      
    }else if(currentZone == 1){
      //image(canalimg,0,0);
      image(groundimg,0,0,width,height);
    }else if(currentZone == 2){
      image(graduateimg,0,0,width,height);
    }
    textAlign(LEFT);
  }
  
  void drawMoistureBar(int barMax, int barWidth, int barStart){
    fill(156,171,250); //blue
    float moistbarLength = map(moisture, 0, 300, 0, barMax);
    rect(barStart, height - 130, moistbarLength, barWidth);
    //text("Soil moisture",30, height - 30);
    text("Moisture",30, height - 120);
  }
  
  void drawPhBar(int barMax, int barWidth, int barStart){
    fill(119,245,111); //green
    float phbarLength = map(ph, 0, 14, 0, barMax);
    //rect(barStart, height - 100, phbarLength, barWidth);
    //text("Soil pH",200, height - 30);
    rect(barStart, height - 90, phbarLength, barWidth);
    text("Soil pH",30, height - 80);
  }
  
  void drawSunlightBar(int barMax, int barWidth, int barStart){
    fill(245,229,111); //yellow
    float sunbarLength = map(sunlight, 0, 12, 0, barMax);
    //rect(barStart, height - 70, sunbarLength, barWidth);
    //text("Sunlight",320, height - 30);
    rect(barStart, height - 50, sunbarLength, barWidth);
    text("Sunlight",30, height - 40);
  }
}
