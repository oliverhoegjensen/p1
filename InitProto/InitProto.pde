import ddf.minim.*;  //<>// //<>// //<>// //<>// //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*; //

Minim minim;
Minim minim1;
Minim minim2;

AudioPlayer kickSound;
AudioPlayer snareSound;
AudioPlayer hatSound;
AudioPlayer percSound;

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
PImage glowButton;
PImage gridOverlay;
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
  glowButton = loadImage("button_glow.png");
  gridOverlay = loadImage("grid_overlay.png");
  gridGuidanceDrums = loadImage("grid_guidance_drums.png");
  arrows = loadImage("arrows.png");

  minim = new Minim(this);
  minim1 = new Minim(this);
  minim2 = new Minim(this);

  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");
  hatSound = minim.loadFile("hat.wav");
  percSound = minim.loadFile("perc.wav");

  slider = new Slider();

  //Pad sounds
  p1 = minim.loadFile("p1.wav");
  p2 = minim.loadFile("p2.wav");
  p3 = minim.loadFile("p3.wav");
  p4 = minim.loadFile("p4.wav");
  p5 = minim.loadFile("p5.wav");
  p6 = minim.loadFile("p6.wav");
  p7 = minim.loadFile("p7.wav");
  p8 = minim.loadFile("p8.wav");
  p9 = minim.loadFile("p9.wav");
  p10 = minim.loadFile("p10.wav");
  p11 = minim.loadFile("p11.wav");

  //Synth sounds
  d1 = minim1.loadFile("d1.wav");
  d2 = minim1.loadFile("d2.wav");
  d3 = minim1.loadFile("d3.wav");
  d4 = minim1.loadFile("d4.wav");
  d5 = minim1.loadFile("d5.wav");
  d6 = minim1.loadFile("d6.wav");
  d7 = minim1.loadFile("d7.wav");
  d8 = minim1.loadFile("d8.wav");
  d9 = minim1.loadFile("d9.wav");
  d10 = minim1.loadFile("d10.wav");
  d11 = minim1.loadFile("d11.wav");

  //Piano sounds
  k1 = minim2.loadFile("k1.wav");
  k2 = minim2.loadFile("k2.wav");
  k3 = minim2.loadFile("k3.wav");
  k4 = minim2.loadFile("k4.wav");
  k5 = minim2.loadFile("k5.wav");
  k6 = minim2.loadFile("k6.wav");
  k7 = minim2.loadFile("k7.wav");
  k8 = minim2.loadFile("k8.wav");
  k9 = minim2.loadFile("k9.wav");
  k10 = minim2.loadFile("k10.wav");
  k11 = minim2.loadFile("k11.wav");  


  AudioPlayer[] melodySounds = {p11, p10, p9, p8, p7, p6, p5, p4, p3, p2, p1};

  AudioPlayer[] melodySounds2 = {d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11};

  AudioPlayer[] melodySounds3 = {k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11};

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
      melodies[i][j]._tone2 = melodySounds2[j];
      melodies[i][j]._tone3 = melodySounds3[j];
      //melodies[i][j]._alpha = alphaAmount;    BGAlpha
      melodies[i][j]._tint = melodyTint;
      melodies[i][j]._tint1 = melodyTint1;
      melodyTint-=20;
      melodyTint1-=5;

      yPos += 40;
      //alphaAmount -= 10;   BGAlpha
    }

    tempoMark += 10;
    xPos+=40;
    yPos=43;
    melodyTint = 255;
    melodyTint1 = 255;
    //alphaAmount = 110;   BGAlpha
  }
}

void draw() {

  background(#FAD9DA);
  //fill(255, BGAlpha);   BGAlpha
  //rect(0, 0, 1280, 720);   BGAlpha  
  tempoCount+=1;
  

  for (int i = 0; i < 16; i++) {

    for (int j = 0; j < 11; j++) {

      if (melodyPush[i][j] == true) {
        melodies[i][j].play();
      }
    }

    if (kicksPush[i] == true) {
      kicks[i].play();
      if (kicks[i]._kickVisual == true) {
        kickVisual = true;
      }
    }

    if (snaresPush[i] == true) {
      snares[i].play();
      if (snares[i]._snareVisual == true) {
        snareVisual = true;
      }
    }

    if (hatsPush[i] == true) {
      hats[i].play();
      if (hats[i]._hatVisual == true) {
        hatVisual = true;
      }
    }

    if (percsPush[i] == true) {
      percs[i].play();
      if (percs[i]._percVisual == true) {
        percVisual = true;
      }
    }
  }

  // Start of kick animation //
  fill(#ff94a7, 255);
  ellipse(157, 200, kickVisualRadius, kickVisualRadius);

  if (kickVisual == true) {

    kickVisualRadius+=20;

    if (kickVisualRadius >= 200) {
      kickVisualRadius = 200;
    }
  }
  // End of kick animation //

  // Start of snare animation //
  pushMatrix(); 

  translate(160, 500); 
  rotate(radians(snareVisualX)); //Change
  fill(#ffcba2, 255);
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

  fill(#f8a393, 255);

  rect(1117, hatVisualY-20, 200, 50);
  rect(1117, hatVisual1Y+20, 200, 50);

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

  translate(1117, 500); 
  rotate(radians(percVisualX)); //Change
  fill(#ffa7d1, 255);
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

  translate(1117, 500);
  arc(0, 0, 200, 200, 0, PI);

  popMatrix();


  // End of perc animation //

  tint(255, 255);

  image(gridGuidanceDrums, 0, 0);
  
  image(arrows,0,0);

  for (int i = 0; i < 16; i++) {

    kicks[i].display();
    snares[i].display();
    hats[i].display();
    percs[i].display();

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
  if (mouseX > 0 && mouseX < 30 && mouseY > 0 && mouseY < 30){
    soundsLibrary ++;
    if (soundsLibrary == 4){
       soundsLibrary = 1; 
    }
  }

  //eventuelt lav function til dette i class'en
  for (int i = 0; i < 16; i++) {

    if (mouseX > kicks[i]._x && mouseX < kicks[i]._x + kicks[i]._width && mouseY > kicks[i]._y && mouseY < kicks[i]._y+kicks[i]._height) {
      kicksPush[i] = !kicksPush[i];


      if (kicksPush[i] == true) {
        kicks[i]._button = colorButton1;
      } else { 
        kicks[i]._button = standardButton;
      }
    }

    if (mouseX > snares[i]._x && mouseX < snares[i]._x + snares[i]._width && mouseY > snares[i]._y && mouseY < snares[i]._y+snares[i]._height) {
      snaresPush[i] = !snaresPush[i];


      if (snaresPush[i] == true) {
        snares[i]._button = colorButton2;
      } else { 
        snares[i]._button = standardButton;
      }
    }

    if (mouseX > hats[i]._x && mouseX < hats[i]._x + hats[i]._width && mouseY > hats[i]._y && mouseY < hats[i]._y+hats[i]._height) {
      hatsPush[i] = !hatsPush[i];


      if (hatsPush[i] == true) {
        hats[i]._button = colorButton3;
      } else { 
        hats[i]._button = standardButton;
      }
    }

    if (mouseX > percs[i]._x && mouseX < percs[i]._x + percs[i]._width && mouseY > percs[i]._y && mouseY < percs[i]._y+percs[i]._height) {
      percsPush[i] = !percsPush[i];


      if (percsPush[i] == true) {
        percs[i]._button = colorButton4;
      } else { 
        percs[i]._button = standardButton;
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