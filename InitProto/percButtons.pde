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
  int _buttonAlpha = 0;
  color _buttonCol;
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
      if (drumsLibrary == 1) {
        _tone.rewind();
        _tone.play();
        percVisualX = 45;
        _percVisual=true;
        println("perc 1");
      }

      if (drumsLibrary == 2) {
        _tone2.rewind();
        _tone2.play();
        percVisualX = 45;
        _percVisual=true;
        println("perc 2");
      }

      if (drumsLibrary == 3) {
        _tone3.rewind();
        _tone3.play();
        percVisualX = 45;
        _percVisual=true;
        println("perc 3");
      }
    }
  }

  void display() {
    tint(255, 255);
    image(_button, _x, _y);
    tint(255, 255);
  }
   
   void pushed(){
    fill(_buttonCol, _buttonAlpha);
    rectMode(CORNER);
   rect(_x, _y, 35, 35); 
  }
}