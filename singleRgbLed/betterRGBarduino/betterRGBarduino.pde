import processing.serial.*;
import java.util.ArrayList;

/**
* The com port the arduino is on
*/
Serial myPort;

/**
* The string name of the com port
*/
String myPortSt;


/**
* The leters that have been typed in
*/

String letters = "";

/**
* For a blinking curser
*/

long timer;

int sliderLength = 600;

int r;
int g;
int b;

Slider rSlider;
Slider gSlider;
Slider bSlider;

Button rButton;
Button gButton;
Button bButton;

Button sliders;

Gauge currentColor;
Gauge projectedColor;

Graph rgb;

void setup(){
  size(1400, 700);
  
  rSlider = new Slider("Red LED", width/2, height/4, sliderLength, 0, 255);
  gSlider = new Slider("Green LED", width/2, height/2, sliderLength, 0, 255);
  bSlider = new Slider("Blue LED", width/2, (height*3)/4, sliderLength, 0, 255);
  
  rSlider.setFill(#ff0000);
  gSlider.setFill(#00ff00);
  bSlider.setFill(#0000ff);
  
  sliders = new Button("Sliders", width/2, (height*7)/8);
  
  rButton = new Button("Red", width/2 + sliderLength/2 + 50, height/4);
  gButton = new Button("Green", width/2 + sliderLength/2 + 50, height/2);
  bButton = new Button("Blue", width/2 + sliderLength/2 + 50, (height*3)/4);
  
  rButton.setCenterColor(#ff0000);
  gButton.setCenterColor(#00ff00);
  bButton.setCenterColor(#0000ff);
  
  currentColor = new Gauge("Current", width/2 + sliderLength/2 + 200, height/3, 0, 255);
  projectedColor = new Gauge("Projected", width/2 + sliderLength/2 + 200, (height*2)/3, 0, 255);
  
  String[] s = {"R", "G", "B"};
  rgb = new Graph("RGB vs TIME", width/2 - sliderLength/2 - 247, height/2, s, 5000);
  
  int[] colors = {#ff0000, #00ff00, #0000ff};
  rgb.setColors(colors);
  
  textAlign(CENTER);
  textSize(32);
  rectMode(CENTER);
  background(#044f6f);
  fill(#ffffff);
  
  currentColor.setGaugeColor(255, 0, 255);
}


void draw(){
  background(#044f6f);
  fill(#ffffff); 
  textSize(32);

  if(myPortSt == null) {
    selectCom();
  } 
  if(myPortSt != null){
    
    if(rButton.getValues()[0] == 1 && sliders.getValues()[0] == 1){
      r = (int) rSlider.getValues()[0];
    }
    else{
      r = 0;
    }
    
    if(gButton.getValues()[0] == 1 && sliders.getValues()[0] == 1){
      g = (int) gSlider.getValues()[0];
    }
    else{
      g = 0;
    }
    
    if(bButton.getValues()[0] == 1 && sliders.getValues()[0] == 1){
      b = (int) bSlider.getValues()[0];
    }
    else{
      b = 0;
    }
    
    currentColor.setValues(new float[] {(r+g+b)/3});
    currentColor.setGaugeColor(r, g, b);
    
    projectedColor.setValues(new float[] {(rSlider.getValues()[0] + gSlider.getValues()[0] + bSlider.getValues()[0])/3});
    projectedColor.setGaugeColor(rSlider.getValues()[0],gSlider.getValues()[0], bSlider.getValues()[0]);
    
    rgb.setValues(new float[] {r, g, b});
    
    rSlider.drawUI();
    gSlider.drawUI();
    bSlider.drawUI();
    
    rButton.drawUI();
    gButton.drawUI();
    bButton.drawUI();
    
    sliders.drawUI();
    
    currentColor.drawUI();
    projectedColor.drawUI();
    
    rgb.drawUI();
    
    String str = "a" + g + ',' + r + ',' + b; 
    myPort.write(str); 
  }
}