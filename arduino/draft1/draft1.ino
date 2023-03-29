#include "DHT.h"
#include <time.h>
#include <WiFi.h>
#include <HTTPClient.h>


const char* ssid = "Nipphittt";
const char* password = "6c8fwslaunso";

#define DHTPIN 2     // Digital pin connected to the DHT sensor

#define DHTTYPE DHT22   // DHT 22  (AM2302), AM2321

// Initialize DHT sensor.
DHT dht(DHTPIN, DHTTYPE);

String serverName = "http://ip.dechhkung.me:9999/send_data";
unsigned long lastTime = 0;
// Timer set to 10 minutes (600000)
//unsigned long timerDelay = 600000;
// Set timer to 5 seconds (5000)
unsigned long timerDelay = 5000;

void initWiFi() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.print("Connecting to WiFi ..");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(1000);
  }
  Serial.println(WiFi.localIP());
}

void setup() {
  Serial.begin(9600);
  Serial.println(F("DHTxx test!"));
  dht.begin();
  initWiFi();
  Serial.print("RRSI: ");
  Serial.println(WiFi.RSSI());

}

void loop() {


  // Wait a few seconds between measurements.
   delay(2000);
   if ((millis() - lastTime) > timerDelay) {
    //Check WiFi connection status
    if(WiFi.status()== WL_CONNECTED){
      WiFiClient client;
      HTTPClient http;
      http.begin(serverName);

      // Get current time as a timestamp
      time_t timestamp = time(nullptr);
   
      // Print timestamp to serial monitor
      Serial.print(F("timestamp: "));
      Serial.println(timestamp*-1);


      // Reading temperature or humidity takes about 250 milliseconds!
      // Sensor readings may also be up to 2 seconds 'old' (its a very slow sensor)
      float h = dht.readHumidity();
      // Read temperature as Celsius (the default)
      float t = dht.readTemperature();
      // Read temperature as Fahrenheit (isFahrenheit = true)
      float f = dht.readTemperature(true);
    
      // Check if any reads failed and exit early (to try again).
      if (isnan(h) && isnan(t) && isnan(f)) {
        Serial.println(F("Failed to read from DHT sensor!"));
        return;
      }
    
      Serial.print(F("Humidity: "));
      Serial.print(h);
      Serial.print(F("%  Temperature: "));
      Serial.print(t);
      Serial.println(F(" C "));
      http.addHeader("Content-Type", "application/json");
    
      int httpResponseCode = http.POST("{\"device_id\":\"gtr398\",\"new_data\":{\"detectedAt\":"+String(timestamp)+",\"humidity\":"+String(h)+",\"temperature\":"+String(t)+"}}");
      Serial.print(httpResponseCode); 
      http.end();
    }
    else {
      Serial.println("WiFi Disconnected");
    }
    lastTime = millis();
  }
  

}
