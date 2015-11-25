class kickButtons {
  
  int _x;
  int _y = 60; 
  int _width;
  int _height;
  
  AudioPlayer _ap;

  kickButtons() {
    _height = 35;
    _width = 35;
    _ap = kickSound;
  }
  
  void play(){
    
   kickSound.rewind(); 
   kickSound.play(); 
  }

  void display() {
    fill(0);
    rect(_x, _y, _width, _height);
  }
}