float analogData;
float tempC = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  analogData = analogRead(0);
  tempC = ((5 * analogData) / 1024 * 100);
  Serial.println(tempC);
  delay(1000);
}
