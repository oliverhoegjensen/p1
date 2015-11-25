class kickButtons {
  
  int _x;
  int _y; 
  int _width;
  int _height;
  int _colR;
  int _colG;
  int _colB;
  
  AudioPlayer _ap;

  kickButtons() {
    _colR = 0;
    _colG = 0;
    _colB = 0;
    _y = 60;
    _height = 35;
    _width = 35;
    _ap = kickSound;
  }
  
  void play(){
    
   kickSound.rewind(); 
   kickSound.play(); 
  }

  void display() {
    fill(_colR, _colG, _colB);
    rect(_x, _y, _width, _height);
  }
}