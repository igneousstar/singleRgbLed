/*
* Handles the event of a key being pressed
* and creates a Serial object to communicate
* with any serial device, like an Arduino 
* connected by USB
*/

void keyPressed() {
  if(myPortSt == null && key != CODED && keyCode != 20){
    if (key == BACKSPACE) {
      if (letters.length() > 0) {
        letters = letters.substring(0, letters.length()-1);
      }
    } 
    else if(key == ENTER) {
      myPortSt = letters;
      try{
        myPort = new Serial(this, letters, 9600);
      }
      catch(Exception e){
        myPortSt = null;
        letters = "Serial port not found!";
      }
 
    }
    else if (textWidth(letters+key) < width) {
      letters = letters + key;
    }
  }
}