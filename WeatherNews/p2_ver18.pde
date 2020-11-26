import processing.serial.*;
Serial serial;
import ddf.minim.*;
Minim minim;

PImage map;
PImage [] chimei = new PImage [14];
PImage [] t_tenki = new PImage [14];
PImage [] tenki = new PImage [28];

Button [] weather = new Button[14];
Display [] Htemparature = new Display[14];
Display [] Ltemparature = new Display[14];
Display ctemp;
Display time;
Display date;
Display title;
Animation robot;
AudioPlayer[] chimei_read= new AudioPlayer [14]; //サウンドデータ格納用の配列、これは地名アナウンス用
AudioPlayer[] num= new AudioPlayer [14]; //数字（気温部分読み上げ）用
AudioPlayer[] result= new AudioPlayer [32]; //「最高気温は」などの部分用

String today = str(day());
String [] W = new String [15];
String [] Htemp = new String [15];
String [] Ltemp = new String [15];
float input;
float temp;
float temp2;
float temp3;
float nScale = 0.007;
float tScale = 0.03;
float step = 5.0;
int mapX = 70;
int mapY = 70;
int check1 = 0;
int check2 = 0;
color c1 = color(255, 255, 255);
color c2 = color(0, 200, 255);
PVector nOffset1, nOffset2;
int moving = 0;
int sound_stop = 0;

void setup() {
  serial=new Serial(this, Serial.list()[2], 9600);
  size(1400, 800);
  frameRate(10);
  textAlign(CENTER, CENTER);
  nOffset1 = new PVector(random(10000), random(10000));
  nOffset2 = new PVector(random(10000), random(10000));

  map = loadImage("全国地図.png");
  for (int i=0; i<14; i++) {
    chimei[i] = loadImage("chimei"+(i+1)+".png");
  }

  for (int i=0; i<28; i++) {
    tenki[i] = loadImage("gazo"+(i+1)+".png");
  }

  for (int i=0; i<14; i++) {
    weather[i] = new Button();
    weather[i].size = 15;
    weather[i].font = createFont("MS Gothic", 48, true);
    weather[i].dia = 100;
    weather[i].read = false;
    weather[i].r = 0;
    weather[i].g = 0;
    weather[i].b = 0;
    weather[i].gazo = i;

    Htemparature[i] = new Display();
    Htemparature[i].size = 20;
    Htemparature[i].font = createFont("MS Gothic", 48, true);
    Htemparature[i].r = 255;
    Htemparature[i].g = 0;
    Htemparature[i].b = 0;
    Htemparature[i].gazo = i;

    Ltemparature[i] = new Display();
    Ltemparature[i].size = 20;
    Ltemparature[i].font = createFont("MS Gothic", 48, true);
    Ltemparature[i].r = 0;
    Ltemparature[i].g = 0;
    Ltemparature[i].b = 255;
    Ltemparature[i].gazo = i;
  }

  weather[0].posX = mapX + 600;
  weather[0].posY = mapY + 70;
  weather[1].posX = mapX + 450;
  weather[1].posY = mapY + 100;
  weather[2].posX = mapX + 380;
  weather[2].posY = mapY + 230;
  weather[3].posX = mapX + 500;
  weather[3].posY = mapY + 320;
  weather[4].posX = mapX + 300;
  weather[4].posY = mapY + 310;
  weather[5].posX = mapX + 450;
  weather[5].posY = mapY + 470;
  weather[6].posX = mapX + 370;
  weather[6].posY = mapY + 395;
  weather[7].posX = mapX + 340;
  weather[7].posY = mapY + 530;
  weather[8].posX = mapX + 270;
  weather[8].posY = mapY + 440;
  weather[9].posX = mapX + 160;
  weather[9].posY = mapY + 430;
  weather[10].posX = mapX + 180;
  weather[10].posY = mapY + 540;
  weather[11].posX = mapX + 80;
  weather[11].posY = mapY + 630;
  weather[12].posX = mapX + 30;
  weather[12].posY = mapY + 500;
  weather[13].posX = mapX + 180;
  weather[13].posY = mapY + 80;

  for (int i=0; i<14; i++) {
    Htemparature[i].posX = weather[i].posX - 20;
    Htemparature[i].posY = weather[i].posY + 28;
    Ltemparature[i].posX = weather[i].posX + 20;
    Ltemparature[i].posY = weather[i].posY + 28;
  }

  ctemp = new Display();
  ctemp.posX = 1200;
  ctemp.posY = 150;
  ctemp.size = 50;
  ctemp.font = createFont("Courier-Bold", 48, true);
  ctemp.r = 0;
  ctemp.g = 0;
  ctemp.b = 0;

  time = new Display();
  time.posX = 1200;
  time.posY = 90;
  time.size = 50;
  time.font = createFont("Courier-Bold", 48, true);
  time.r = 0;
  time.g = 0;
  time.b = 0;

  date = new Display();
  date.posX = 1200;
  date.posY = 30;
  date.size = 50;
  date.font = createFont("Courier-Bold", 48, true);
  date.r = 0;
  date.g = 0;
  date.b = 0;

  title = new Display();
  title.posX = 200;
  title.posY = 40;
  title.size = 50;
  title.font = createFont("Courier-Bold", 48, true);
  title.r = 0;
  title.g = 0;
  title.b = 0;

  robot = new Animation();
  robot.png = loadImage("robot_ver2.png");
  robot.posX = 1400;
  robot.posY = 320;
  robot.vx = 100; 
  robot.vy = 0;
  robot.wid = 480;
  robot.hei = 480;

  minim = new Minim(this); //初期化

  for (int i=0; i<14; i++)
  {
    chimei_read[i]=minim.loadFile("s.chimei."+i+"_01.wav");
  }
  for (int i=0; i<14; i++)
  {
    num[i]=minim.loadFile("number."+i+"_01.wav");
  }
  for (int i=0; i<32; i++)
  {
    result[i]=minim.loadFile("result."+i+"_01.wav");
  }
}

void draw() {
  if (check1 == 0) {
    getWeather();
    check1++;
  }
  if (moving % 4 == 3) {
    rewind();
  }
  background(255);
  backscreen();
  screen();
}

void serialEvent(Serial port)
{
  if (check2 == 0) {
    input=port.read();

    temp=(5000*input)/1024;
    temp2=floor(temp);
    temp3=temp2/10;
    check2++;
  }
}

void mousePressed() {
  if (moving % 4 == 0) {
    for (int i=0; i<14; i++) {
      if (dist(mouseX, mouseY, weather[i].posX, weather[i].posY) < weather[i].dia) {
        weather[i].read = true;
        moving++;
      }
    }
  }
}

void stop()
{
  for (int i=0; i<14; i++)
  {
    chimei_read[i].close();
  }
  for (int i=0; i<14; i++)
  {
    num[i].close();
  }
  for (int i=0; i<32; i++)
  {
    result[i].close();
  }
  minim.stop();
  super.stop();
}
