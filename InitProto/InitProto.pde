import ddf.minim.*; //<>// //<>// //<>// //<>// //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer kickSound;
AudioPlayer snareSound;

boolean[] kicksPush = new boolean[16];

float tempoCount = 0;

/*
int[] buttonX = new int[16];
 int[] buttonY = new int[16];
 */

int xPos = 320;
int yPos = 60;

kickButtons[] kicks = new kickButtons[16];

void setup() {
  size(1280, 720);
  frameRate(60);

  minim = new Minim(this);
  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");

  background(255);

  for (int i = 0; i < kicks.length; i++) {

    kicks[i] = new kickButtons();
    kicks[i]._x = xPos;

    xPos+=40;
  }

  for (int i = 0; i < kicks.length; i++) {

    kicks[i].display();
  }
}

void draw() {
  tempoCount++;

/*
  if (b1 == true) {
    if (tempoCount == 1) {
    }
  }
  */

  if (tempoCount == 60) {
    tempoCount = 0;
  }
}

void mouseReleased() {

  for (int i = 0; i < kicks.length; i++) {

    if (mouseX > kicks[i]._x && mouseX < kicks[i]._x + kicks[i]._width && mouseY > kicks[i]._y && mouseY < kicks[i]._y+kicks[i]._height) {
      kicksPush[i] = !kicksPush[i];
      println(kicksPush[i]);
    }
  }
}