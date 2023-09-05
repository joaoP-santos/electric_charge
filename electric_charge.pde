import java.math.BigDecimal;
import java.util.Random;
import teilchen.behavior.*;
import teilchen.*;
import teilchen.test.*;
import teilchen.util.*;
import teilchen.integration.*;
import teilchen.examples.*;
import teilchen.cubicle.*;
import teilchen.force.*;
import teilchen.wip.*;
import teilchen.constraint.*;

Physics system;
PFont cmusr;
Atom atom;
Random rand = new Random();
float atomSize;
int protons = 1;
int electrons = 1;
int neutrons = 1;

void setup() {
  fullScreen();
  atomSize = height * 0.1;
  system = new Physics();
  cmusr = createFont("CMU Serif Roman.ttf", 36);
  atom = new Atom(width / 2, height / 2, atomSize, 1, 1, 1, " ");
  orientation(LANDSCAPE);
}

void draw() {
  if(protons-electrons >=1) {
      background(255, 211, 255);
  }
  else if(protons-electrons <=-1) {
      background(189, 255, 255);
  } else{  background(189, 211, 255);
}
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  textFont(cmusr);
  atom.show();
  if(protons-electrons <=-1) {
      fill(0);
  }
  text((protons - electrons) + " X 3,6X10^(-19) = " +   BigDecimal.valueOf((protons-electrons)*3.6)
    .setScale(3, BigDecimal.ROUND_HALF_UP)
    .floatValue() + "X10^(-19)C", width/2, height/10*9);
  final float time = 1.0f / frameRate;
  system.step(time);
  strokeWeight(2);
}

void mousePressed() {
  if (mouseX < width/2 && mouseY < height/2 && protons <=18) {
    protons++;
    neutrons++;
  } else if (mouseX < width/2 && mouseY > height/2 && protons > 1) {
    protons--;
    neutrons--;
  } else if (mouseX > width/2 && mouseY < height/2 && electrons <=18) {
    electrons++;
  } else if (mouseX > width/2 && mouseY > height/2 && electrons >1) {
    electrons--;
  }

  updateAtom();
}

void updateAtom() {
  atom = new Atom(width / 2, height / 2, atomSize, protons, neutrons, electrons, " ");
}
