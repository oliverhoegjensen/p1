import ddf.minim.*;  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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

AudioPlayer kickSound2;
AudioPlayer snareSound2;
AudioPlayer hatSound2;
AudioPlayer percSound2;

AudioPlayer kickSound3;
AudioPlayer snareSound3;
AudioPlayer hatSound3;
AudioPlayer percSound3;


//pad objects
AudioPlayer p1;
AudioPlayer p2;
AudioPlayer p3;
AudioPlayer p4;
AudioPlayer p5;
AudioPlayer p6;
AudioPlayer p7;
AudioPlayer p8;
AudioPlayer p9;
AudioPlayer p10;
AudioPlayer p11;

//Synth objects
AudioPlayer d1;
AudioPlayer d2;
AudioPlayer d3;
AudioPlayer d4;
AudioPlayer d5;
AudioPlayer d6;
AudioPlayer d7;
AudioPlayer d8;
AudioPlayer d9;
AudioPlayer d10;
AudioPlayer d11;

//Piano objects
AudioPlayer k1;
AudioPlayer k2;
AudioPlayer k3;
AudioPlayer k4;
AudioPlayer k5;
AudioPlayer k6;
AudioPlayer k7;
AudioPlayer k8;
AudioPlayer k9;
AudioPlayer k10;
AudioPlayer k11;


PImage standardButton;
PImage colorButton1;
PImage colorButton2;
PImage colorButton3;
PImage colorButton4;
PImage colorButton5;
PImage gridGuidanceDrums;
PImage arrows;

boolean[] kicksPush = new boolean[16];
boolean[] snaresPush = new boolean[16];
boolean[] hatsPush = new boolean[16];
boolean[] percsPush = new boolean[16];

boolean[][] melodyPush = new boolean [16][11];

boolean kickVisual;
boolean snareVisual;
boolean hatVisual;
boolean percVisual;

float snareVisualX = 45;

float percVisualX = 45;

int hatVisualY = 170;
int hatVisual1Y = 200;
boolean hatMover;
boolean hat1Mover;

float tempoCount = 0;
//float BGAlpha = 0;   BGAlpha
//float alphaAmount = 110;   BGAlpha

int kickVisualRadius = 200;
int kickVisualTimer;

int melodyTint = 255;
int melodyTint1 = 255;

int xPos = 323;
int yPos = 43;
int tempoMark = 1;
int kickAlpha = 255;

byte soundsLibrary = 1;

color BG = #d9521f;
color kick = #ff6c57;
color snare = #8f4a2d;
color hat = #e3be8d;
color perc = #ff7e8a;
color sliderCol = #ffffff;

kickButtons[] kicks = new kickButtons[16];
snareButtons[] snares = new snareButtons[16];
hatButtons[] hats = new hatButtons[16];
percButtons[] percs = new percButtons[16];

melodyButtons[][] melodies = new melodyButtons[16][11];

Slider slider; 

void setup() {
  size(1280, 720, P2D);
  frameRate(60);
  noStroke();

  standardButton = loadImage("button_standard.png");
  colorButton1 = loadImage("button_colored_1.png");
  colorButton2 = loadImage("button_colored_2.png");
  colorButton3 = loadImage("button_colored_3.png");
  colorButton4 = loadImage("button_colored_4.png");
  colorButton5 = loadImage("button_colored_5.png");
  gridGuidanceDrums = loadImage("grid_guidance_drums.png");
  arrows = loadImage("arrows.png");

  minim = new Minim(this);

  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");
  hatSound = minim.loadFile("hat.wav");
  percSound = minim.loadFile("perc.wav");

  kickSound2 = minim.loadFile("kick2.wav");
  snareSound2 = minim.loadFile("snare2.wav");
  hatSound2 = minim.loadFile("hat2.wav");
  percSound2 = minim.loadFile("perc2.wav");

  kickSound3 = minim.loadFile("kick3.wav");
  snareSound3 = minim.loadFile("snare3.wav");
  hatSound3 = minim.loadFile("hat3.wav");
  percSound3 = minim.loadFile("perc3.wav");

  slider = new Slider();

  //Pad sounds
  p1 = minim.loadFile("b1.wav");
  p2 = minim.loadFile("b2.wav");
  p3 = minim.loadFile("b3.wav");
  p4 = minim.loadFile("b4.wav");
  p5 = minim.loadFile("b5.wav");
  p6 = minim.loadFile("b6.wav");
  p7 = minim.loadFile("b7.wav");
  p8 = minim.loadFile("b8.wav");
  p9 = minim.loadFile("b9.wav");
  p10 = minim.loadFile("b10.wav");
  p11 = minim.loadFile("b11.wav");

  //Synth sounds
  d1 = minim.loadFile("s1.wav");
  d2 = minim.loadFile("s2.wav");
  d3 = minim.loadFile("s3.wav");
  d4 = minim.loadFile("s4.wav");
  d5 = minim.loadFile("s5.wav");
  d6 = minim.loadFile("s6.wav");
  d7 = minim.loadFile("s7.wav");
  d8 = minim.loadFile("s8.wav");
  d9 = minim.loadFile("s9.wav");
  d10 = minim.loadFile("s10.wav");
  d11 = minim.loadFile("s11.wav");

  //Piano sounds
  k1 = minim.loadFile("v1.wav");
  k2 = minim.loadFile("v2.wav");
  k3 = minim.loadFile("v3.wav");
  k4 = minim.loadFile("v4.wav");
  k5 = minim.loadFile("v5.wav");
  k6 = minim.loadFile("v6.wav");
  k7 = minim.loadFile("v7.wav");
  k8 = minim.loadFile("v8.wav");
  k9 = minim.loadFile("v9.wav");
  k10 = minim.loadFile("v10.wav");
  k11 = minim.loadFile("v11.wav");  


  AudioPlayer[] melodySounds = {p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11};

  AudioPlayer[] melodySounds2 = {d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11};

  AudioPlayer[] melodySounds3 = {k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11};

  for (int i = 0; i < 16; i++) {

    kicks[i] = new kickButtons();
    kicks[i]._x = xPos;
    kicks[i]._tempoMark = tempoMark;
    kicks[i]._tone = kickSound;
    kicks[i]._tone2 = kickSound2;
    kicks[i]._tone3 = kickSound3;

    snares[i] = new snareButtons();
    snares[i]._x = xPos;
    snares[i]._tempoMark = tempoMark;
    snares[i]._tone = snareSound;
    snares[i]._tone2 = snareSound2;
    snares[i]._tone3 = snareSound3;

    hats[i] = new hatButtons();
    hats[i]._x = xPos;
    hats[i]._tempoMark = tempoMark;
    hats[i]._tone = hatSound;
    hats[i]._tone2 = hatSound2;
    hats[i]._tone3 = hatSound3;

    percs[i] = new percButtons();
    percs[i]._x = xPos;
    percs[i]._tempoMark = tempoMark;
    percs[i]._tone = percSound;
    percs[i]._tone2 = percSound2;
    percs[i]._tone3 = percSound3;

    for (int j = 0; j < 11; j++) {

      melodies[i][j] = new melodyButtons();
      melodies[i][j]._x = xPos;
      melodies[i][j]._y = yPos;
      melodies[i][j]._tempoMark = tempoMark;
      melodies[i][j]._tone = melodySounds[j];
      melodies[i][j]._tone2 = melodySounds2[j];
      melodies[i][j]._tone3 = melodySounds3[j];
      melodies[i][j]._tint = melodyTint;
      melodies[i][j]._tint1 = melodyTint1;

      melodyTint-=10;
      melodyTint1-=25;

      yPos += 40;
    }

    tempoMark += 10;
    xPos+=40;
    yPos=43;
    melodyTint = 255;
    melodyTint1 = 255;
  }
}

void draw() {

  background(BG);

  tempoCount+=1;

  for (int i = 0; i < 16; i++) {

    for (int j = 0; j < 11; j++) {

      if (melodyPush[i][j] == true) {
        melodies[i][j].play();
      }
    }

    if (kicksPush[i] == true) {
      kicks[i].play();
      kicks[i]._buttonCol = kick;
      if (kicks[i]._kickVisual == true) {
        kickVisual = true;
      }
    }

    if (snaresPush[i] == true) {
      snares[i].play();
      snares[i]._buttonCol = snare;
      if (snares[i]._snareVisual == true) {
        snareVisual = true;
      }
    }

    if (hatsPush[i] == true) {
      hats[i].play();
      hats[i]._buttonCol = hat;
      if (hats[i]._hatVisual == true) {
        hatVisual = true;
      }
    }

    if (percsPush[i] == true) {
      percs[i].play();
      percs[i]._buttonCol = perc;
      if (percs[i]._percVisual == true) {
        percVisual = true;
      }
    }
  }

  // Start of kick animation //
  fill(kick, 255);
  ellipse(142, 220, kickVisualRadius, kickVisualRadius);

  if (kickVisual == true) {

    kickVisualRadius+=20;

    if (kickVisualRadius >= 200) {
      kickVisualRadius = 200;
    }
  }
  // End of kick animation //

  // Start of snare animation //
  pushMatrix(); 

  translate(140, 500); 
  rotate(radians(snareVisualX)); //Change
  fill(snare, 255);
  rectMode(CENTER);
  rect(0, 0, 150, 150); 

  if (snareVisual == true) {
    snareVisualX += 15;

    snareVisualX *= 0.965;

    if (snareVisualX >= 405) {
      snareVisualX = 405;
    }
  } 

  popMatrix();
  // End of snare animation //

  // Start of hat animation // 

  fill(hat, 255);

  rect(1143, hatVisualY-20, 200, 50);
  rect(1143, hatVisual1Y+20, 200, 50);

  if (hatVisual == true) {

    if (hatMover == true) {
      hatVisualY+=10;
    } else { 
      hatVisualY-=1;
    }

    if (hatVisualY >= 185) {
      hatVisualY = 185;
      hatMover = false;
    }

    if (hatVisualY <= 170) {
      hatVisualY = 170;
    }

    if (hat1Mover == true) {
      hatVisual1Y-=10;
    } else { 
      hatVisual1Y+=1;
    }

    if (hatVisual1Y <= 185) {
      hatVisual1Y = 185;
      hat1Mover = false;
    }

    if (hatVisual1Y >= 200) {
      hatVisual1Y = 200;
    }
  }

  // End of hat animation //

  // Start of perc animation //

  pushMatrix(); 

  translate(1140, 500); 
  rotate(radians(percVisualX)); //Change
  fill(perc, 255);
  arc(0, 0, 200, 200, PI, TWO_PI);

  if (percVisual == true) {
    percVisualX += 20;

    percVisualX *= 0.965;

    if (percVisualX >= 405) {
      percVisualX = 405;
    }
  } 

  popMatrix();

  pushMatrix();

  translate(1140, 500);
  arc(0, 0, 200, 200, 0, PI);

  popMatrix();

  // End of perc animation //

  image(gridGuidanceDrums, 0, 0);
  image(arrows, 0, 0);

  for (int i = 0; i < 16; i++) {

    kicks[i].display();
    snares[i].display();
    hats[i].display();
    percs[i].display();

    kicks[i].pushed();
    hats[i].pushed();
    snares[i].pushed();
    percs[i].pushed();

    for (int j = 0; j < 11; j++) {
      melodies[i][j].display();
    }
  }

  if (tempoCount == 160) {
    tempoCount = 0;
  }

  slider.display();
  slider.move();
}

void mouseReleased() {
  if (mouseX >= 963 && mouseX <= 1003 && mouseY >= 204 && mouseY <= 318) {
    soundsLibrary ++;
    if (soundsLibrary == 4) {
      soundsLibrary = 1;
    }

    if (soundsLibrary == 1) {
      BG = #d9521f;
      kick = #ff6c57;
      snare = #8f4a2d;
      hat = #e3be8d;
      perc = #ffb5cc;
      sliderCol = #fde128;
    }

    if (soundsLibrary == 2) {
      BG = #270636;
      kick = #8566c1;
      snare = #34fffd;
      hat = #621084;
      perc = #fc19f6;
      sliderCol = #1feb4a;
    }
    if (soundsLibrary == 3) {
      BG = #a38d74;
      kick = #b5b5b5;
      snare = #ffc5d7;
      hat = #e34f0c;
      perc = #96ac6f;
      sliderCol = #b9b9ff;
    }
  }

  if (mouseX >= 278 && mouseX <= 317 && mouseY >= 204 && mouseY <= 318) {
    soundsLibrary --;
    if (soundsLibrary == 0) {
      soundsLibrary = 3;
    }

    if (soundsLibrary == 1) {
      BG = #d9521f;
      kick = #ff6c57;
      snare = #8f4a2d;
      hat = #e3be8d;
      perc = #ffb5cc;
      sliderCol = #fde128;
    }

    if (soundsLibrary == 2) {
      BG = #270636;
      kick = #8566c1;
      snare = #34fffd;
      hat = #621084;
      perc = #fc19f6;
      sliderCol = #1feb4a;
    }
    if (soundsLibrary == 3) {
      BG = #a38d74;
      kick = #b5b5b5;
      snare = #ffc5d7;
      hat = #e34f0c;
      perc = #96ac6f;
      sliderCol = #b9b9ff;
    }
  }

  for (int i = 0; i < 16; i++) {

    if (mouseX > kicks[i]._x && mouseX < kicks[i]._x + kicks[i]._width && mouseY > kicks[i]._y && mouseY < kicks[i]._y+kicks[i]._height) {
      kicksPush[i] = !kicksPush[i];


      if (kicksPush[i] == true) {
        kicks[i]._buttonAlpha = 255;
      } else { 
        kicks[i]._button = standardButton;
        kicks[i]._buttonAlpha = 0;
      }
    }

    if (mouseX > snares[i]._x && mouseX < snares[i]._x + snares[i]._width && mouseY > snares[i]._y && mouseY < snares[i]._y+snares[i]._height) {
      snaresPush[i] = !snaresPush[i];


      if (snaresPush[i] == true) {
        snares[i]._buttonAlpha = 255;
      } else { 
        snares[i]._button = standardButton;
        snares[i]._buttonAlpha = 0;
      }
    }

    if (mouseX > hats[i]._x && mouseX < hats[i]._x + hats[i]._width && mouseY > hats[i]._y && mouseY < hats[i]._y+hats[i]._height) {
      hatsPush[i] = !hatsPush[i];


      if (hatsPush[i] == true) {
        hats[i]._buttonCol = hat;
        hats[i]._buttonAlpha = 255;
      } else { 
        hats[i]._button = standardButton;
        hats[i]._buttonAlpha = 0;
      }
    }

    if (mouseX > percs[i]._x && mouseX < percs[i]._x + percs[i]._width && mouseY > percs[i]._y && mouseY < percs[i]._y+percs[i]._height) {
      percsPush[i] = !percsPush[i];


      if (percsPush[i] == true) {
        percs[i]._buttonAlpha = 255;
      } else { 
        percs[i]._button = standardButton;
        percs[i]._buttonAlpha = 0;
      }
    }

    for (int j = 0; j < 11; j++) {
      if (mouseX > melodies[i][j]._x && mouseX < melodies[i][j]._x + melodies[i][j]._width && mouseY > melodies[i][j]._y && mouseY < melodies[i][j]._y+melodies[i][j]._height) {
        melodyPush[i][j] = !melodyPush[i][j];


        if (melodyPush[i][j] == true) {
          melodies[i][j]._button = colorButton5;
        } else { 
          melodies[i][j]._button = standardButton;
          melodies[i][j]._colorChange = false;
        }
      }
    }
  }
}