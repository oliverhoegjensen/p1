class kickButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _colR;
  int _colG;
  int _colB;
  int _tempoMark;
  int visualTimer;
  PImage _button;
  boolean kickVisual;

  kickButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 63;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) {
      visualTimer = millis();
      kickSound.rewind(); 
      kickSound.play();
      println("Kick");
      kickVisualRadius = 1;
    }

    if (millis() - visualTimer < 500) {
      kickVisual=true;
    } else { kickVisual = false; }
  }

  void display() {
    image(_button, _x, _y);
  }

  void visual() {
    int r = 0;

    noStroke();

    r+=400;

    fill(230);
    ellipse(width/2, height/2, r, r);
  }
}