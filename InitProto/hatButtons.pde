class hatButtons {

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
  boolean _hatVisual;

  hatButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 583;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      _visualTimer = millis();
      hatSound.rewind(); 
      hatSound.play();
      hatMover = true;
      hat1Mover = true;
      println("Hat");
    }
    
    if (millis() - _visualTimer < 500) {
      _hatVisual=true;
    } else { _hatVisual = false; }
  }

  void display() {
    //fill(_colR, _colG, _colB);
    //rect(_x, _y, _width, _height);
    image(_button, _x, _y);
  }
}