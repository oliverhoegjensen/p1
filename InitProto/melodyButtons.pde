class melodyButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _tempoMark;
  int _tint;
  int _tint1;
  PImage _button;
  boolean _colorChange;

  AudioPlayer _tone;
  AudioPlayer _tone2;
  AudioPlayer _tone3;

  melodyButtons() {
    _y = 63;
    _height = 35;
    _width = 35;
    _button = standardButton;
    _tint = 255;
  }

  void play() {
    _colorChange = true;

    if (tempoCount == _tempoMark) { 
      if (soundsLibrary == 1) {
        _tone.rewind();
        _tone.play();
      }

      if (soundsLibrary == 2) {
        _tone2.rewind();
        _tone2.play();
      }

      if (soundsLibrary == 3) {
        _tone3.rewind();
        _tone3.play();
      }
    }
  }

  void display() {

    if (soundsLibrary ==1) {
      if (_colorChange == true) {
        tint(255, _tint, _tint1, 255);
      }
    }
    if (soundsLibrary ==2) {
      if (_colorChange == true) {
        tint(_tint, _tint1, 255, 255);
      }
    }
    if (soundsLibrary ==3) {
      if (_colorChange == true) {
        tint(_tint, 255, _tint1, 255);
      }
    }
    image(_button, _x, _y);
    tint(255,255,255,255);
  }
}