class kickButtons {
  float _x;
  float _y;
  float _width;
  float _height;
  boolean _push;
  AudioPlayer _ap;

  kickButtons(float x) {
    _x = x;
    _y = 200;
    _height = 40;
    _width = 40;
    _push = false;
    _ap = kickSound;
  }

  void display() {
    rect(_x, _y, _width, _height);
  }
}