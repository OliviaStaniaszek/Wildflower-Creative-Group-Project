/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen. 
 */
int value = 0;

PShape map;

//float ry;

int x = 400; //width/2;
int y = 150;//width/2;
int z = 50;//-150;
int rx = -450;
int ry = 0;
  
public void setup() {
  size(900, 500, P3D);
    
  map = loadShape("map.obj");
  //rotateZ(HALF_PI);
  //map.setFill(color(99,209,100));
}

public void draw() {
  background(0);
  lights();
  directionalLight(100, 100, 100, 0, 0, -1);
  //directionalLight(100,100,100, 10,10,10);
  //directionalLight(126, 126, 126, 0, 10, 0);
  //ambientLight(150,150,150);
  //float cameraY = height/2.0;
  //float fov = mouseX/float(width) * PI/2;
  //float cameraZ = cameraY / tan(fov / 2.0);
  //float aspect = float(width)/float(height);
  //if (mousePressed) {
  //  aspect = aspect / 2.0;
  //}
  //perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
  //translate(width/2+30, height/2, 0);
  //rotateX(-PI/6);
  //rotateY(PI/3 + mouseY/float(height) * PI);
  // Change height of the camera with mouseY
  //camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
  //       0.0, 0.0, 0.0, // centerX, centerY, centerZ
  //       0.0, 1.0, 0.0); // upX, upY, upZ
  
  //camera(70.0, 35.0, 120.0, 50.0, 50.0, 0.0, 
  //     0.0, 1.0, 0.0);
  //translate(50, 50, 0);  
  
  //translate(width/2, height/2 + 100, -200);
  //rotateZ(PI);
  
  translate(x, y, z);
  //rotateZ(PI);
  //rotateY(ry);
  rotateX(rx);
  rotateY(ry);
  shape(map);
  
  //ry += 0.02;
}

void keyPressed() {
  if (key == 'a') {
    x+=50;
    println(x,y,z);
  } else if (key == 'd'){
    x-=50;
    println(x,y,z);
  } else if (key == 'w'){
    y+=50;
    println(x,y,z);
  } else if (key == 's'){
    y-=50;
    println(x,y,z);
  } else if (key == 'k'){
    z-=50;
    println(x,y,z);
  } else if (key == 'l'){
    z+=50;
    println(x,y,z);
  }else if (key == 'y'){
    rx-=50;
    println(x,y,z);
  } else if (key == 'h'){
    rx+=50;
    println(x,y,z,rx,ry);
  }else if (key == 'u'){
    ry-=50;
    println(x,y,z);
  } else if (key == 'j'){
    ry+=50;
    println(x,y,z,rx,ry);
  }
}
