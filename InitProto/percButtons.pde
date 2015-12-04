class percButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _tempoMark;
  int _buttonAlpha = 0;
  color _buttonCol;
  PImage _button;
  boolean _percVisual;

  AudioSample _tone;
  AudioSample _tone2;
  AudioSample _tone3;

  percButtons() {
    _y = 643;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      if (soundsLibrary == 1) {
        _tone.trigger();
        percVisualX = 45;
        _percVisual=true;
        println("perc 1");
      }

      if (soundsLibrary == 2) {
        _tone2.trigger();
        percVisualX = 45;
        _percVisual=true;
        println("perc 2");
      }

      if (soundsLibrary == 3) {
        _tone3.trigger();
        percVisualX = 45;
        _percVisual=true;
        println("perc 3");
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