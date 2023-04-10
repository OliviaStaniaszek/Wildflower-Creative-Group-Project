# Rewilding Campus
Creative Group Project Group A:
Olivia, Kamryn, Catalin, Nadia, Yaseen

## Final prototypes

### visualisation.pde
Prototype showing how the user would navigate our program and the visual style
**map screen**
- click filter buttons to filter out areas with those conditions
- simple flowers shown in areas to show rough number of flowers planted in that area
- hover over a green space to highlight it
- click on a green space to view it close up
**green space screen**
- quantity of flowers based on how many flowers were planted in that area
- 'health bars' in the bottom right show the conditions of that area
- condition of area also show in the flowers 
    open/ closed petals -> sunny/shady area
    big/ crumpled leaves -> high/low soil moisture
    blue/green/yellow stem -> alkaline/neutral/acidic soil
- click 'plant here' to go to the confirmation screen, this adds a new flower to the visualisation

### sketch_3d_map.pde
Prototype showing 3D map functionality. Ideally we would like the user to be able to traverse the 3D map, populated with flowers as in the green space screen in visualisation.pde. 
- 3D map made in Blender
- imported into processing as multiple objects
- uses PeasyCam library
- controls:
    works best with mouse
    left click drag to rotate camera
    right click drag/ scroll wheel to zoom
    middle drag to pan
    double click to reset
    shift key to rotate/pan on one axis

With no limit on money or time, we would like to implement the functionality of the 3D map with the style and colours of the 2D visualisation

### sensor_testing.pde && senosr_to_processing.ino
Prototype showing Arduino taking in the sensor values and putting them in a csv file in Processing, then Processing uses that information to change the healthiness of the flower.
- Using the Serial to transfer the information from Arduino to Processing
- myPort has to have the correct value, whichever port in the list of ports your computer has that is controling the Arduino myPort has to equal the same
- Arduino code can not be open while running the processing code otherwise anerror will pop up
- there is a delay in the changing of the flowers, even when the values have changed the flowers take a while to change and be representative of the live data from the Arduino sensors


## Images
## visualisation.pde

![Map screen](https://user-images.githubusercontent.com/95420080/230772210-17243def-2d79-4d9d-8381-b692ac66dd83.png) 
![Sunny filter selected](https://user-images.githubusercontent.com/95420080/230772223-688fbc1e-19b5-4f19-b3b1-e1f5e342725e.png)
![Ground cafe close up screen](https://user-images.githubusercontent.com/95420080/230772232-fca7324b-fc88-4d3e-acd0-3374cbd00501.png)
![Queens Building close up screen](https://user-images.githubusercontent.com/95420080/230772240-9ced74c9-1d82-4141-bbdf-7a49f6ddc67d.png)
![Graduate Centre - plant seeds](https://user-images.githubusercontent.com/95420080/230774872-1f5a6f33-c2c8-460e-b775-ec39d99509ca.png)

## 3D map
![3D map](https://user-images.githubusercontent.com/95420080/230772627-33f8b590-7b7a-4fa2-b42c-a98f439be5ec.png)
![3D map zoomed in](https://user-images.githubusercontent.com/95420080/230772649-a82df36e-6c69-4d17-8192-caf23573f6fa.png)


