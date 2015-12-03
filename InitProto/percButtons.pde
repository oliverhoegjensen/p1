class percButtons {

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
  boolean _percVisual;
  
  AudioPlayer _tone;
  AudioPlayer _tone2;
  AudioPlayer _tone3;

  percButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 643;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      percVisualX = 45;
      _visualTimer = millis();
      percSound.rewind(); 
      percSound.play();
      println("Perc");
    }
    
    if (millis() - _visualTimer < 500) {
      _percVisual=true;
    }
  }

  void display() {
    tint(255,255);
    image(_button, _x, _y);
    tint(255,255);
  }
}