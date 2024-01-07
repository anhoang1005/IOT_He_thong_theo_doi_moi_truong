#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <TaskScheduler.h>
#include <DHT.h>

#define DHTPIN 4 // Chân DATA của DHT11 kết nối với D2 trên ESP8266
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

const char* ssid = "12344321";
const char* password = "12341234";

#define MQTT_SERVER "broker.hivemq.com"
#define MQTT_PORT 1883
#define MQTT_USER "hoangvanan"
#define MQTT_PASSWORD "Anhan10052002"
#define MQTT_LDP_TOPIC "SENSORDATA"
#define MQTT_CONTROL_TOPIC "LEDCONTROL"

WiFiClient wifiClient;
PubSubClient client(wifiClient);

Scheduler runner;

int current_ledState1 = LOW;
int last_ledState1 = LOW;
int current_ledState2 = LOW;
int last_ledState2 = LOW;
int current_ledState3 = LOW;
int last_ledState3 = LOW;
bool isFlashing = false;
bool isFlashing1 = false;
bool isFlashing2 = false;

void setup_wifi() {
  Serial.println("Connecting to...");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  randomSeed(micros());
  Serial.println("");
  Serial.println("WiFi connected!!!");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void connect_to_broker() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    String clientId = "testtopic";
    clientId += String(random(0xffff), HEX);
    if (client.connect(clientId.c_str(), MQTT_USER, MQTT_PASSWORD)) {
      Serial.println("MQTT connected");
      client.subscribe(MQTT_CONTROL_TOPIC);
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 2 seconds");
      delay(2000);
    }
  }
}

void callback(char* topic, byte *payload, unsigned int length) {
  Serial.println("-------new message from broker-----");
  Serial.print("topic: ");
  Serial.println(topic);
  Serial.print("message: ");
  Serial.write(payload, length);
  Serial.println();
  if (*payload == 'a') {
    current_ledState1 = HIGH;
    Serial.println(current_ledState1);
  }
  if (*payload == 'b') {
    current_ledState1 = LOW;
    Serial.println(current_ledState1);
  }
  if (*payload == 'c') {
    current_ledState2 = HIGH;
    Serial.println(current_ledState2);
  }
  if (*payload == 'd') {
    current_ledState2 = LOW;
    Serial.println(current_ledState2);
  }
  if (*payload == 'g') {
    current_ledState3 = HIGH;
    Serial.println(current_ledState3);
  }
  if (*payload == 'h') {
    current_ledState3 = LOW;
    Serial.println(current_ledState3);
  }
  if (*payload == 'e') {
    isFlashing = true;
    isFlashing1 = true;
    isFlashing2 = true;
  }
  if (*payload == 'f') {
    isFlashing = false;
    isFlashing1 = false;
    isFlashing2 = false;
    digitalWrite(5, LOW); // Tắt đèn 5
    digitalWrite(2, LOW);
    digitalWrite(13, LOW);
  }
}

void send_data() {
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();
  int sensorValue = 1024 - analogRead(A0);
  String sensorValueStr = String(humidity) + "-" + String(temperature) + "-" + String(sensorValue);
  client.publish(MQTT_LDP_TOPIC, sensorValueStr.c_str());
}

Task sendDataTask(2000, TASK_FOREVER, &send_data);

void flashLED5() {
  if (isFlashing) {
    digitalWrite(5, !digitalRead(5));
  }
  if (isFlashing1) {
    digitalWrite(13, !digitalRead(13));
  }
   if (isFlashing2) {
    digitalWrite(2, !digitalRead(2));
  }
}

Task flashLEDTask(500, TASK_FOREVER, &flashLED5);

void setup() {
  Serial.begin(115200);
  dht.begin();
  pinMode(5, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(13, OUTPUT);
  Serial.setTimeout(500);
  setup_wifi();
  client.setServer(MQTT_SERVER, MQTT_PORT);
  client.setCallback(callback);
  connect_to_broker();

  runner.addTask(sendDataTask);
  runner.addTask(flashLEDTask);

  sendDataTask.enable();
  flashLEDTask.enable();
}

void loop() {
  client.loop();
  if (!client.connected()) {
    connect_to_broker();
  }

  if (last_ledState1 != current_ledState1) {
    last_ledState1 = current_ledState1;
    digitalWrite(5, current_ledState1);
  }
  if (last_ledState2 != current_ledState2) {
    last_ledState2 = current_ledState2;
    digitalWrite(13, current_ledState2);
  }
  if (last_ledState3 != current_ledState3) {
    last_ledState3 = current_ledState3;
    digitalWrite(2, current_ledState3);
  }

  runner.execute();
}
