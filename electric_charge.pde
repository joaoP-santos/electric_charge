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
int protons = 1; int electrons = 1; int neutrons = 1;
void settings() {
  fullScreen();
  atomSize = height * 0.7;
}

void setup() {
  system = new Physics();
  cmusr = createFont("CMU Serif Roman.ttf", 36);
  atom = new Atom(width / 2, height / 2, atomSize, 1, 1, 1, " ");
  orientation(LANDSCAPE);
}

void draw() {
  background(189, 211, 255);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  textFont(cmusr);
  atom.show();
  final float time = 1.0f / frameRate;
  system.step(time);
  strokeWeight(2);
}

void updateAtom() {
  atom = new Atom(width / 2, height / 2, atomSize, protons, neutrons, electrons, " ");
}
