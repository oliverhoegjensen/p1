class kickButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _tempoMark;
  int _buttonAlpha = 0;
  PImage _button;
  boolean _kickVisual;
  color _buttonCol;

  AudioSample _tone;
  AudioSample _tone2;
  AudioSample _tone3;

  kickButtons() {
    _y = 523;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      if (soundsLibrary == 1) {
        _tone.trigger();
        kickVisualRadius = 0;
        _kickVisual=true;
      }

      if (soundsLibrary == 2) {
        _tone2.trigger();
        kickVisualRadius = 0;
        _kickVisual=true;
      }

      if (soundsLibrary == 3) {
        _tone3.trigger();
        kickVisualRadius = 0;
        _kickVisual=true;
      }
    }
  }

  void display() {
    image(_button, _x, _y);
  }
  
   void pushed(){
   fill(_buttonCol, _buttonAlpha);
   rectMode(CORNER);
   rect(_x, _y, 35, 35); 
  }
}