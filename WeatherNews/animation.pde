class Animation {
  int posX;
  int posY;
  int vx;
  int vy;
  int wid;
  int hei;
  PImage png;
  int stop_number;
  boolean stop_check;
  int stopX;

  void anime() {
    image(png, posX, posY, wid, hei);
  }

  void stop_decide() {
    stopX = weather[0].posX + 80;
  }

  void move() {
    if (moving % 4 == 1) {
      if (posX > stopX) {
        posX -= vx;
      } else {
        moving++;
      }
    } else if (moving % 4 == 3) {
      if (posX < 1400) {
        posX += vx;
      } else { 
        moving++;
      }
    }
  }
}
