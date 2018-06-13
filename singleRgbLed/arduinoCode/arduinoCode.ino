#define RED_LED 11
#define GREEN_LED 10
#define BLUE_LED 9

int r = 127;
int g = 127;
int b = 127;

void setup() {
  Serial.begin(9600); 
  pinMode(RED_LED, OUTPUT);
  pinMode(GREEN_LED, OUTPUT);
  pinMode(BLUE_LED, OUTPUT);
  
}

void loop() {
  
  if (Serial.available() > 0) {  
    if (Serial.find("a")) {
      r = Serial.parseInt();
      g = Serial.parseInt();
      b = Serial.parseInt();
      
    }
  }

  analogWrite(RED_LED, r);
  analogWrite(GREEN_LED, g);
  analogWrite(BLUE_LED, b); 
  delay(5);
}
