#include "115A.h"
//#include <OneWire.h>


Adafruit_MPL115A2 mpl115a2;

int incomingByte = 0; // for incoming serial data
int RPIRelay = D3;   //RPI
int CasoRelay = D2;   //Caso power
int switchPIN = D4;

bool DEBUG = true;
int maxTemp = 45;
int state = 0;

SerialLogHandler logHandler(LOG_LEVEL_WARN);

inline void softDelay(uint32_t t) {
  for (uint32_t ms = millis(); millis() - ms < t; Particle.process());  //  safer than a delay()
}


void setup() {
    
    pinMode(RPIRelay, OUTPUT);
    pinMode(CasoRelay, OUTPUT);
    pinMode(switchPIN, INPUT_PULLDOWN);
  //  attachInterrupt(switchPIN, buttonPressInterrupt, RISING);  
    BLE.off();
    RGB.control(true);
    RGB.color(255, 0, 0);
    digitalWrite(CasoRelay, LOW);
    digitalWrite(RPIRelay, LOW);

    mpl115a2.begin();
    softDelay(1000);
    state=0;
    Serial.begin();

    

}



void readTemp() {
    Log.warn("Read temp");
    // mpl115a2.begin();
    float temperatureC = 0;    
    temperatureC = mpl115a2.getTemperature();  
    Serial.println("particletemp" + String(temperatureC));
    if (DEBUG == true){
        Particle.publish("temp",String(temperatureC));
    }
    if (temperatureC > maxTemp){
        Log.warn("Temperature too high");
        if (DEBUG == true){
            Particle.publish("Message ","Go to sleep because high temperature");
        }
        shutDown();
    }
}


void shutDown(){
    Log.warn("Shutdown");
    if (DEBUG == true){
        Particle.publish("Message ","Go to sleep");
    }
    
    digitalWrite(CasoRelay, LOW); 
    Serial.println("SHUT");
    delay(30000);
    digitalWrite(RPIRelay, LOW);
    state = 0;
    //softDelay(15000);
    //System.sleep(config);
    
}


//void buttonPressInterrupt(){                                
 //   state = 1;
  //  Particle.publish("Interrupt ","Button pressed");
 
   
//}

void action(){

 if (state==0) {
        digitalWrite(CasoRelay, LOW);
        digitalWrite(RPIRelay, LOW);
        RGB.color( 255,0, 0);

  } else if (state==1) {
       digitalWrite(RPIRelay, HIGH);
       digitalWrite(CasoRelay, LOW);
       RGB.color(0, 50, 0);
  } else if (state ==2){
      digitalWrite(RPIRelay, HIGH);
      digitalWrite(CasoRelay, LOW);
      RGB.color(0, 50, 255);
  
    } else if (state ==3){
      digitalWrite(RPIRelay, HIGH);
      digitalWrite(CasoRelay, HIGH);
      RGB.color(50, 255, 255);
    } else if (state ==4){
      digitalWrite(RPIRelay, HIGH);
      digitalWrite(CasoRelay, HIGH);
      RGB.color(100, 255, 255);
  } else if (state ==9){
      shutDown();
  }
}

bool comLoop(){
    
    if (Serial.available() > 0) {
        incomingByte = Serial.read();
        Particle.publish("Serial message ",String(incomingByte,DEC));
        state = incomingByte;
        return true;
        } else {
    
        return false;
        }
}


void loop() {
    Particle.publish("Main loop","request serial");
    readTemp();
    Serial.println("REQU");
    softDelay(500);
    if (comLoop()==true){
        action();
    } else {
        Log.warn("Restart PI loop");
        Particle.publish("Main loop","restatl");
        Serial.print("REBOOT");
        delay(120000);
        if (comLoop()==true){
            action();
        } else {
            shutDown();
        }
    }

    delay(1000);

    
}



void wifiOFF(){
    Log.warn("Wifi Off");
    Particle.publish("OFF wifi ","String(incomingByte,DEC)");

    Particle.disconnect();
    WiFi.off();
}


