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

  AudioPlayer _tone;
  AudioPlayer _tone2;
  AudioPlayer _tone3;

  hatButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 603;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      if (drumsLibrary == 1) {
        _tone.rewind();
        _tone.play();
        hatMover = true;
        hat1Mover = true;
        _hatVisual=true;
        println("hat 1");
      }

      if (drumsLibrary == 2) {
        _tone2.rewind();
        _tone2.play();
        hatMover = true;
        hat1Mover = true;
        _hatVisual=true;
        println("hat 2");
      }

      if (drumsLibrary == 3) {
        _tone3.rewind();
        _tone3.play();
        hatMover = true;
        hat1Mover = true;
        _hatVisual=true;
        println("hat 3");
      }
    }
  }

  void display() {
    tint(255, 255);
    image(_button, _x, _y);
    tint(255, 255);
  }
}