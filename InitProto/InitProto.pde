import ddf.minim.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer kickSound;
AudioPlayer snareSound;
AudioPlayer hatSound;

boolean[] kicksPush = new boolean[16];
boolean[] snaresPush = new boolean[16];
boolean[] hatsPush = new boolean[16];

float tempoCount = 0;

/*
int[] buttonX = new int[16];
 int[] buttonY = new int[16];
 */

int xPos = 320;
int yPos = 60;
int tempoMark = 1;

kickButtons[] kicks = new kickButtons[16];
snareButtons[] snares = new snareButtons[16];
hatButtons [] hats = new hatButtons[16];

void setup() {
  size(1280, 720);
  frameRate(60);
  noStroke();

  minim = new Minim(this);
  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");
  hatSound = minim.loadFile("hat.wav");

  background(255);

  for (int i = 0; i < kicks.length; i++) {

    kicks[i] = new kickButtons();
    kicks[i]._x = xPos;
    kicks[i]._tempoMark = tempoMark;

    snares[i] = new snareButtons();
    snares[i]._x = xPos;
    snares[i]._tempoMark = tempoMark;

    hats[i] = new hatButtons();
    hats[i]._x = xPos;
    hats[i]._tempoMark = tempoMark;

    tempoMark += 10;
    xPos+=40;
  }
}

void draw() {

  for (int i = 0; i < kicks.length; i++) {

    kicks[i].display();
    snares[i].display();
    hats[i].display();

    if (kicksPush[i] == true) {
      kicks[i].play();
    }

    if (snaresPush[i] == true) {
      snares[i].play();
    }

    if (hatsPush[i] == true) {
      hats[i].play();
    }
  }

  tempoCount++;

  if (tempoCount == 160) {
    tempoCount = 0;
  }
}

void mouseReleased() {

  for (int i = 0; i < kicks.length; i++) {

    if (mouseX > kicks[i]._x && mouseX < kicks[i]._x + kicks[i]._width && mouseY > kicks[i]._y && mouseY < kicks[i]._y+kicks[i]._height) {
      kicksPush[i] = !kicksPush[i];

      println(kicksPush[i]);

      if (kicksPush[i] == true) {
        kicks[i]._colB = 255;
      } else { 
        kicks[i]._colB = 0;
      }
    }

    if (mouseX > snares[i]._x && mouseX < snares[i]._x + snares[i]._width && mouseY > snares[i]._y && mouseY < snares[i]._y+snares[i]._height) {
      snaresPush[i] = !snaresPush[i];

      println(snaresPush[i]);

      if (snaresPush[i] == true) {
        snares[i]._colR = 255;
      } else { 
        snares[i]._colR = 0;
      }
    }

    if (mouseX > hats[i]._x && mouseX < hats[i]._x + hats[i]._width && mouseY > hats[i]._y && mouseY < hats[i]._y+hats[i]._height) {
      hatsPush[i] = !hatsPush[i];

      println(hatsPush[i]);

      if (hatsPush[i] == true) {
        hats[i]._colG = 255;
      } else { 
        hats[i]._colG = 0;
      }
    }
  }
}