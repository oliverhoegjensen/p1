class percButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _colR;
  int _colG;
  int _colB;
  int _tempoMark;
  PImage _button;

  percButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 183;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      percSound.rewind(); 
      percSound.play();
      println("Perc");
    }
  }

  void display() {
    //fill(_colR, _colG, _colB);
    //rect(_x, _y, _width, _height);
    image(_button, _x, _y);
  }
}