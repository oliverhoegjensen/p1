class Slider {
  float _x;
  float _y;
  float _width;
  float _height;
  float _speed;

  Slider(float x, float y, float speed) {
    _x = x;
    _y = y;
    _width = 1;
    _height = height;
    _speed = speed;
  }

  void display() {
    strokeWeight(3);
    fill(#11F5E0);
    rect(_x, _y, _width, _height);
  }
  
  void move(){
    _x += _speed;
    if(_x >= width){
      _x = 0;
    }
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