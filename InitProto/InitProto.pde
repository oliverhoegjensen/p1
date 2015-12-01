import ddf.minim.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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


PImage standardButton;
PImage colorButton1;
PImage colorButton2;
PImage colorButton3;
PImage colorButton4;
PImage colorButton5;
PImage glowButton;

boolean[] kicksPush = new boolean[16];
boolean[] snaresPush = new boolean[16];
boolean[] hatsPush = new boolean[16];
boolean[] percsPush = new boolean[16];

boolean[][] melodyPush = new boolean [16][11];

boolean kickVisual;
boolean snareVisual;
boolean hatVisual;

float snareVisualX = 45;

int hatVisualY = 145;
int hatVisual1Y = 225;
boolean hatMover;
boolean hat1Mover;

int tempoCount = 0;

int kickVisualRadius = 500;
int kickVisualTimer;

int xPos = 323;
int yPos = 223;
int tempoMark = 1;
int kickAlpha = 255;

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

  minim = new Minim(this);
  kickSound = minim.loadFile("kick.wav");
  snareSound = minim.loadFile("snare.wav");
  hatSound = minim.loadFile("hat.wav");
  percSound = minim.loadFile("perc.wav");

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


  AudioPlayer[] melodySounds = {p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11};

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
    yPos=223;
  }
}

void draw() {

  tempoCount++;
  background(#FADCE3);

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
    }
  }

  // Start of kick animation //
  noStroke();
  fill(#fff19a, 150);
  ellipse(width/2, height/2, kickVisualRadius, kickVisualRadius);

  if (kickVisual == true) {

    kickVisualRadius+=40;

    if (kickVisualRadius >= 500) {
      kickVisualRadius = 500;
    }
  }
  // End of kick animation //

  // Start of snare animation //
  pushMatrix(); 

  translate(300, 300); 
  rotate(radians(snareVisualX)); //Change
  fill(#ff9aa8, 150);
  rectMode(CENTER);
  rect(0, 0, 300, 300); 

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
 
  noStroke();
  fill(#f99aff, 150);
  rectMode(CORNER);
  rect(805,hatVisualY,300,30);
  rect(805,hatVisual1Y,300,30);

  if (hatVisual == true) {
    
  if (hatMover == true){
  hatVisualY+=10;
  } else { hatVisualY-=10; }
  
  if (hatVisualY >= 172){
   hatVisualY = 172;
   hatMover = false;
  }
  
  if (hatVisualY <= 150){
    hatVisualY = 150;
  }
    
  if (hat1Mover == true){
  hatVisual1Y-=10;
  } else { hatVisual1Y+=10; }
  
  if (hatVisual1Y <= 202){
   hatVisual1Y = 202;
   hat1Mover = false;
  }
  
  if (hatVisual1Y >= 225){
    hatVisual1Y = 225;
  }
    
  }
  
  // End of hat animation //

  slider.display();
  slider.move();
  
  tint(255,150);

  for (int i = 0; i < 16; i++) {

    kicks[i].display();
    snares[i].display();
    hats[i].display();
    percs[i].display();

    for (int j = 0; j < 11; j++) {
      melodies[i][j].display();
    }
  }

  tint(255, 255);

  if (tempoCount == 160) {
    tempoCount = 0;
  }
}

void mouseReleased() {

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
        }
      }
    }
  }
}