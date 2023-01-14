String readString;
int finger;

#include <Wire.h> 

#include  <TimerOne.h>          

volatile int i=0;               
volatile boolean zero_cross=0;  
int AC_pin = 11;                
int alpha = 115;
int alpha_raw;                                          
int freqStep = 75;    
int zc_condition;
int saturation = 128;


void setup() {
  

   pinMode(AC_pin, OUTPUT);                          

  attachInterrupt(0, zero_cross_detect, RISING);    
  Timer1.initialize(freqStep);                      
  Timer1.attachInterrupt(zc_check, freqStep);  
  
  Serial.begin(9600);


}


void zero_cross_detect() {    
  zero_cross = true;               
  i=0;
  digitalWrite(AC_pin, LOW);       
}   

void zc_check() {                   
  if(zero_cross == true) {              
    if(i>=alpha) {                     
      digitalWrite(AC_pin, HIGH);        
      i=0;                       
      zero_cross = false; 
    } 
    else {
      i++;     
    }                                
  }
  else {
    digitalWrite(AC_pin, LOW); //debug                                  
    i++;
  }

   if (i > saturation){
        zc_condition = 0;
        i = saturation;             
      } else{
        zc_condition = 1;
      }
                            
}    

void loop() {

  while (Serial.available()) {
    char c = Serial.read();  
    readString += c; 
    delay(2);  
  }

    if (readString.length() >0) {
    Serial.println(readString);  
    alpha_raw  = readString.toInt();  
 alpha = map(alpha_raw, 0, 5, 115, 10);    
 readString=""; 
}
}
