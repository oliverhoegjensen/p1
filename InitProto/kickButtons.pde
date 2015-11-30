class kickButtons {

  int _x;
  int _y; 
  int _width;
  int _height;
  int _colR;
  int _colG;
  int _colB;
  int _tempoMark;
  PImage _button;
  boolean played;

  kickButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 63;
    _height = 35;
    _width = 35;
    _button = standardButton;
  }

  void play() {
    if (tempoCount == _tempoMark) { 
      kickSound.rewind(); 
      kickSound.play();
      println("Kick");
    }
    
    if (tempoCount >= _tempoMark && tempoCount <= _tempoMark + 10){
     visual(); 
    }
  }

  void display() {
    image(_button, _x, _y);
  }

  void visual() {
    int r = 200;
    noStroke();
    fill(230);
    ellipse(600, 400, r, r);
  }
}