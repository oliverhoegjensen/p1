import ddf.minim.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*; //

Minim minim;
AudioPlayer kickSound;
AudioPlayer snareSound;
AudioPlayer hatSound;
AudioPlayer percSound;

// sax melody sounds
AudioPlayer c1;
AudioPlayer d1;
AudioPlayer e1;
AudioPlayer g1;
AudioPlayer a1;
AudioPlayer c2;
AudioPlayer d2;
AudioPlayer e2;
AudioPlayer g2;
AudioPlayer a2;
AudioPlayer c3;

boolean[] kicksPush = new boolean[16];
boolean[] snaresPush = new boolean[16];
boolean[] hatsPush = new boolean[16];
boolean[] percsPush = new boolean[16];

boolean[][] melodyPush = new boolean [16][11];

float tempoCount = 0;

int xPos = 320;
int yPos = 220;
int tempoMark = 1;

kickButtons[] kicks = new kickButtons[16];
snareButtons[] snares = new snareButtons[16];
hatButtons[] hats = new hatButtons[16];
percButtons[] percs = new percButtons[16];

melodyButtons[][] melodies = new melodyButtons[16][11];

Slider slider; 

void setup() {
  size(1280, 720);
  frameRate(60);
  noStroke();
  
  
  minim = new Minim(this);
  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");
  hatSound = minim.loadFile("hat.wav");
  percSound = minim.loadFile("hat.wav");

  slider = new Slider();
  
  c1 = minim.loadFile("c1.wav");
  d1 = minim.loadFile("d1.wav");
  e1 = minim.loadFile("e1.wav");
  g1 = minim.loadFile("g1.wav");
  a1 = minim.loadFile("a1.wav");
  c2 = minim.loadFile("c2.wav");
  d2 = minim.loadFile("d2.wav");
  e2 = minim.loadFile("e2.wav");
  g2 = minim.loadFile("g2.wav");
  a2 = minim.loadFile("a2.wav");
  c3 = minim.loadFile("c3.wav");

  AudioPlayer[] melodySounds = {c3, a2, g2, e2, d2, c2, a1, g1, e1, d1, c1};

  for (int i = 0; i < 16; i++) {

    kicks[i] = new kickButtons();
    kicks[i]._x = xPos;
    kicks[i]._tempoMark = tempoMark;

    snares[i] = new snareButtons();
    snares[i]._x = xPos;
    snares[i]._tempoMark = tempoMark;

    hats[i] = new hatButtons();
    hats[i]._x = xPos;
    hats[i]._tempoMark = tempoMark;
    
    percs[i] = new percButtons();
    percs[i]._x = xPos;
    percs[i]._tempoMark = tempoMark;

    for (int j = 0; j < 11; j++) {

      melodies[i][j] = new melodyButtons();
      melodies[i][j]._x = xPos;
      melodies[i][j]._y = yPos;
      melodies[i][j]._tempoMark = tempoMark;
      melodies[i][j]._tone = melodySounds[j];

      yPos += 40;
    }

    tempoMark += 10;
    xPos+=40;
    yPos=220;
  }
}

void draw() {
  
  background(90);

  tempoCount++;
  background(255);
  
  slider.display();
  slider.move();

  for (int i = 0; i < 16; i++) {

    kicks[i].display();
    snares[i].display();
    hats[i].display();
    percs[i].display();

    for (int j = 0; j < 11; j++) {
      melodies[i][j].display();

      if (melodyPush[i][j] == true) {
        melodies[i][j].play();
      }
    }

    if (kicksPush[i] == true) {
      kicks[i].play();
    }

    if (snaresPush[i] == true) {
      snares[i].play();
    }

    if (hatsPush[i] == true) {
      hats[i].play();
    }
    
    if (percsPush[i] == true) {
      percs[i].play();
    }
  }


  if (tempoCount == 160) {
    tempoCount = 0;
  }
}

void mouseReleased() {

  for (int i = 0; i < 16; i++) {

    if (mouseX > kicks[i]._x && mouseX < kicks[i]._x + kicks[i]._width && mouseY > kicks[i]._y && mouseY < kicks[i]._y+kicks[i]._height) {
      kicksPush[i] = !kicksPush[i];


      if (kicksPush[i] == true) {
        kicks[i]._colB = 255;
      } else { 
        kicks[i]._colB = 0;
      }
    }

    if (mouseX > snares[i]._x && mouseX < snares[i]._x + snares[i]._width && mouseY > snares[i]._y && mouseY < snares[i]._y+snares[i]._height) {
      snaresPush[i] = !snaresPush[i];


      if (snaresPush[i] == true) {
        snares[i]._colR = 255;
      } else { 
        snares[i]._colR = 0;
      }
    }

    if (mouseX > hats[i]._x && mouseX < hats[i]._x + hats[i]._width && mouseY > hats[i]._y && mouseY < hats[i]._y+hats[i]._height) {
      hatsPush[i] = !hatsPush[i];


      if (hatsPush[i] == true) {
        hats[i]._colG = 255;
      } else { 
        hats[i]._colG = 0;
      }
    }
    
    if (mouseX > percs[i]._x && mouseX < percs[i]._x + percs[i]._width && mouseY > percs[i]._y && mouseY < percs[i]._y+percs[i]._height) {
      percsPush[i] = !percsPush[i];


      if (percsPush[i] == true) {
        percs[i]._colR = 100;
      } else { 
        percs[i]._colG = 0;
      }
    }

    for (int j = 0; j < 11; j++) {
      if (mouseX > melodies[i][j]._x && mouseX < melodies[i][j]._x + melodies[i][j]._width && mouseY > melodies[i][j]._y && mouseY < melodies[i][j]._y+melodies[i][j]._height) {
        melodyPush[i][j] = !melodyPush[i][j];


        if (melodyPush[i][j] == true) {
          melodies[i][j]._colG = 100;
        } else { 
          melodies[i][j]._colG = 0;
        }
      }
    }
  }
}