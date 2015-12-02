class kickButtons {

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
  boolean _kickVisual;

  kickButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 523;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) {
      _visualTimer = millis();
      kickSound.rewind(); 
      kickSound.play();
      println("Kick");
      kickVisualRadius = 0; 
    }

    if (millis() - _visualTimer < 500) {
      _kickVisual=true;
    } else { _kickVisual = false; }
  }

  void display() {
    tint(255,180);
    image(_button, _x, _y);
  }
}