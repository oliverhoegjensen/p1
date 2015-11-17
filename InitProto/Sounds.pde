class Sounds {
  float _x;
  float _y;
  float _width;
  float _height;

  Sounds(float x, float y) {
    _x = x;
    _y = y;
    _height = 1;
    _width = 1;
  }

  void display() {
    color c = int(random(255));
    fill(c);
    rect(_x, _y, _width, _height);
  }
  
  

  float left() {
    return _x;
  }

  float right() {
    return _x+_width;
  }

  float top() {
    return _y;
  }

  float bottom() {
    return _y+_height;
  }
}