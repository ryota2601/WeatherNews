class Display {
  int posX;
  int posY;
  int size;
  int dia;
  int r;
  int g;
  int b;
  int gazo;
  PFont font;

  void string(String x) {
    fill(r, g, b);
    textFont (font);
    textSize(size);
    text(x, posX, posY);
  }
  
}
