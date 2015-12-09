class hatButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _tempoMark;
  int _buttonAlpha = 0;
  color _buttonCol;
  PImage _button;

  AudioSample _tone;
  AudioSample _tone2;
  AudioSample _tone3;

  hatButtons() {
    _y = 603;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      if (soundsLibrary == 1) {
        _tone.trigger();
        hatMover = true;
        hat1Mover = true;
      }

      if (soundsLibrary == 2) {
        _tone2.trigger();
        hatMover = true;
        hat1Mover = true;
      }

      if (soundsLibrary == 3) {
        _tone3.trigger();
        hatMover = true;
        hat1Mover = true;
      }
    }
  }

  void display() {
    image(_button, _x, _y);
  }

  void pushed() {
    fill(_buttonCol, _buttonAlpha);
    rectMode(CORNER);
    rect(_x, _y, 35, 35);
  }
}