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

kickButtons k1;

boolean b1 = false;
boolean b2 = false;

float tempoCount = 0;

int[] buttonX = new int[16];
int[] buttonY = new int[16];
int xPos = 320;
int yPos = 60;
int buttonDim = 35;

void setup() {
  size(1280, 720);
  frameRate(60);


  minim = new Minim(this);
  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");

  slider = new Slider(-2, 0, 2);
  k1 = new kickButtons(width * 1/8);
  
  background(255);

  for (int i = 0; i < 15; i++) {

    buttonX[i] = xPos;
    yPos=60;
    xPos+=40;

    for (int j = 0; j < 15; j++) {

      buttonY[j] = yPos;

      fill(0);
      noStroke();
      rect(xPos, yPos, buttonDim, buttonDim);  

      yPos+=40;
    }
  }
}

void draw() {
  tempoCount++;

  k1.display();

  if (b1 == true) {
    if (tempoCount == 1) {
      kickSound.rewind();
      kickSound.play();
      println("kick");
    }
  }

  if (tempoCount == 60) {
    tempoCount = 0;
  }
}

void mouseReleased() {
  if (mouseX > k1._x && mouseX < k1._x + k1._width && mouseY > k1._y && mouseY < k1._y + k1._height) {
    b1 = !b1;
  }
}