class eParticle {
  Particle particle;
  Particle atom;
  float x;
  float y;
  float parentX;
  float parentY;
  float size;
  String type;
  color pColor;
  String content;
  float atomSize;
  float valency;
  eParticle(float x, float y, float size, String type, Particle atom, float atomSize, float valency) {
    particle = system.makeParticle(x, y);
    this.valency = valency;
    this.parentX = atom.position().x; this.parentY = atom.position().y; this.atomSize = atomSize;
    this.x = atom.position().x - x; this.y = atom.position().y - y; this.size = size; this.atom = atom; this.type = type;
    switch (type) {
      case "proton":
        this.pColor = color(255, 0, 0);
        this.content = "+";
        break;
      case "neutron":
        this.pColor = color(150, 120);
        this.content = "";
        break;
      case "electron":
        this.pColor = color(0, 255, 0);
        this.content = "-";
    }
  }
  
  void show() {
    this.parentX = atom.position().x; this.parentY = atom.position().y;
    float vibrationX = random(0, 5);
    float vibrationY = random(0, 5);
    if (this.type == "electron") {
      float angle = random(0, 360);
      vibrationX = 0;
      vibrationY = 0;
      this.x = cos(angle)* this.atomSize * 1.3 + cos(angle)*this.valency* size/0.5; 
      this.y = sin(angle) * this.atomSize * 1.3 + sin(angle)*this.valency* size/0.5;
    }
    particle.position().set(this.parentX + this.x + vibrationX, this.parentY +this.y + vibrationY);
    
    fill(this.pColor);
    ellipse(particle.position().x, particle.position().y, this.size, this.size);
    
    fill(255);
    textSize(this.size);
    text(this.content, particle.position().x, particle.position().y);
  }
}
