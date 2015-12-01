class Slider {
  int _x;
  int _y;
  int _width;
  int _height;

  Slider() {
    _x = 323;
    _y = 361;
    _width = 3;
    _height = 594;
  }

  void display() {
    strokeWeight(1);
    fill(#11F5E0,150);
    rectMode(CENTER);
    rect(_x, _y, _width, _height);
  }
  
  void move(){
    _x += 2;
    if(_x >= 963){
      _x = 323;
    }
  }
}