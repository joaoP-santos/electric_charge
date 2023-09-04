import java.util.Collections;

class Atom {
   Particle atom;
   float x;
   float y;
   float size;
   ArrayList<eParticle> particles = new ArrayList<eParticle>();
   String element;
   int layers;
   Atom(float x, float y, float size, int protons, int neutrons, int electrons, String element) {
     float particleSize = size/3.125;
     this.x = x; this.y = y; this.size = size;
     this.element = element;
     atom = system.makeParticle(x, y);
     atom.mass(protons + neutrons);
     atom.radius(200);
     for(int i = 0; i < neutrons; i++) {
       eParticle neutron = new eParticle(random(x - size/2 + particleSize/2, x + size/2 - particleSize/2), random(y - size/2 + particleSize/2, y + size/2 - particleSize/2), particleSize, "neutron", atom, size, i);
       this.particles.add(neutron);
     }
     for(int i = 0; i < protons; i++) {
       eParticle proton = new eParticle(random(x - size/2 + particleSize/2, x + size/2 - particleSize/2), random(y - size/2 + particleSize/2, y + size/2 - particleSize/2), particleSize, "proton", atom, size, i);
       this.particles.add(proton);
     }
     
     for(int i = 0; i < electrons; i++) {
      float angle = random(0, 360);
      float valency = 0;
      if(i < 2) {
        valency = 1;
        this.layers = 1;
      } else if(i < 10) {
        valency = 2;
        this.layers = 2;
      } else if(i < 12) {
        valency = 3;
        this.layers = 3;
      } else if(i < 18) {
        valency = 4;
        this.layers = 4;
      }
      eParticle electron = new eParticle(x + cos(angle)*size, y + sin(angle) * size, particleSize, "electron", atom, size, valency);
      this.particles.add(electron);  
      
     }
     
     print (this.layers);
     Collections.shuffle(this.particles);
 }
   void show() {
     textSize(this.size/2);
     text(this.element, this.atom.position().x, this.atom.position().y - this.size);
     
     for(int i=0; i < this.layers; i++) {
       fill(255, 0);
       stroke(0, 50);
       ellipse(this.atom.position().x, this.atom.position().y, 4*size + 1.2*i*this.size, 4*size + 1.2*i*this.size);

       stroke(0);
     }
     
     
     for (eParticle p : this.particles) {
       p.show();
     }
   }

}
