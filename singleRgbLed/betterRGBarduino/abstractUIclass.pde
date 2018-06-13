abstract class UIobject{

  abstract void setCenter(int centerX,int centerY);
  
  abstract void setValues(float values[]);

  abstract void drawUI();
  
  abstract float[] getValues();
  
  abstract int[] getCenter();  
  
  abstract String getN();
}