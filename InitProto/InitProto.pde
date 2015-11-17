import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer kickSound;
AudioPlayer snareSound;

Slider slider;
Sounds kick;
Sounds snare;

float tempoCount = 0;

void setup() {
  size(1280, 720);
  frameRate(60);
  background(255);
  

  minim = new Minim(this);
  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");

  slider = new Slider(-2, 0, 2);
  kick = new Sounds(0, 200);
  snare = new Sounds(110, 200);
}

void draw() {
  tempoCount++;
  
  slider.display();
  slider.move();

  kick.display();
  snare.display();

  if (tempoCount == 1) {
    kickSound.rewind();
    kickSound.play();
    println("kick");
  }

  if (tempoCount == 30) {
    snareSound.rewind();
    snareSound.play();
    println("snare");
  }
  
  if (tempoCount == 60){
    tempoCount = 0;
    
  }
}

boolean collisionBetween(Slider rect1, Sounds rect2) {

  return (rect1.left() < rect2.right() && rect2.left() < rect1.right() && rect1.top() < rect2.bottom() && rect2.top() < rect1.bottom());
}