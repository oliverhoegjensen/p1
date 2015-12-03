class snareButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _colR;
  int _colG;
  int _colB;
  int _tempoMark;
  int _visualTimer;
  PImage _button;
  boolean _snareVisual;

  snareButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 563;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      snareVisualX = 45;
      _visualTimer = millis();
      snareSound.rewind(); 
      snareSound.play();
      println("Snare");
    }
    
    if (millis() - _visualTimer < 500) {
      _snareVisual=true;
    }
  }

  void display() {
    tint(255,255);
    image(_button, _x, _y);
    tint(255,255);
  }
}