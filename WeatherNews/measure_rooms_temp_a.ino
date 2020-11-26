
void setup()
{
  Serial.begin(9600);
}

void loop()
{
 int analogData=analogRead(0);

  Serial.write(analogData)/4;
  delay(1000);
  }
