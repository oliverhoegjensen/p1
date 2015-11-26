class hatButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _colR;
  int _colG;
  int _colB;
  int _tempoMark;

  hatButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 140;
    _height = 35;
    _width = 35;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      hatSound.rewind(); 
      hatSound.play();
    }
  }

  void display() {
    fill(_colR, _colG, _colB);
    rect(_x, _y, _width, _height);
  }
}