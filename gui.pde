/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void onProtonsChange(GSlider source, GEvent event) { //_CODE_:protons:954909:
  atom = new Atom(width / 2, height / 2, atomSize, protons.getValueI(), 12, electrons.getValueI(), " ");
  println();
} //_CODE_:protons:954909:

public void onElectronsChange(GSlider source, GEvent event) { //_CODE_:electrons:267703:
  atom = new Atom(width / 2, height / 2, atomSize, protons.getValueI(), 12, electrons.getValueI(), " ");
} //_CODE_:electrons:267703:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  protons = new GSlider(this, 4, 11, 400, 60, 20.0);
  protons.setShowValue(true);
  protons.setLimits(1.0, 1.0, 30.0);
  protons.setEasing(5.0);
  protons.setNumberFormat(G4P.DECIMAL, 0);
  protons.setOpaque(false);
  protons.addEventHandler(this, "onProtonsChange");
  electrons = new GSlider(this, 6, 65, 400, 60, 20.0);
  electrons.setShowValue(true);
  electrons.setLimits(1, 1, 30);
  electrons.setEasing(5.0);
  electrons.setNumberFormat(G4P.INTEGER, 0);
  electrons.setOpaque(false);
  electrons.addEventHandler(this, "onElectronsChange");
}

// Variable declarations 
// autogenerated do not edit
GSlider protons; 
GSlider electrons; 
