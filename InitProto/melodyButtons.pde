class melodyButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _colR;
  int _colG;
  int _colB;
  int _tempoMark;
  int _tint;
  int _tint1;
  PImage _button;
  boolean _colorChange;
  
  AudioPlayer _tone;

  melodyButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 63;
    _height = 35;
    _width = 35;
    _button = standardButton;
    _tint = 255;
  }

  void play() {
    _colorChange = true;
    if (tempoCount == _tempoMark) { 
      _tone.rewind();
      _tone.play();
      println("Melody");
 
    }
    
  }

  void display() {
    
    if (_colorChange == true){
      tint(_tint,_tint1,255,180);
    }
    
    image(_button, _x, _y);
    tint(255,255);
    
  }
}