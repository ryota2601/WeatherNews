class Button extends Display { 
  boolean read;
  
  void shape() {
    noFill();
    ellipse(posX, posY, dia+3, dia+3);
    image(chimei[gazo], posX-dia/2, posY-dia/2, dia, dia);
    image(t_tenki[gazo], posX-dia/2, posY-dia/2, dia, dia);
  }
  
}
