class Slider {
  int _x;
  int _y;
  int _width;
  int _height;

  Slider() {
    _x = 316;
    _y = 43;
    _width = 3;
    _height = 435;
  }

  void display() {
    if(_x>323){
    strokeWeight(1);
    fill(sliderCol,255);
    rectMode(CORNER);
    rect(_x, _y, _width, _height);
    rect(_x, _y+480, _width, 155);
    }
  }
  
  void move(){
    _x += 4;
    if(_x >= 956){
      _x = 316;
    }
  }
}