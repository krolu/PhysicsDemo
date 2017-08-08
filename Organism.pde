import org.jbox2d.dynamics.joints.*;

class Organism {
  ArrayList<Particle> particles;
  int x;
  int y;
  int size;
  DistanceJoint[] joints;
  
  Organism(int x_, int y_, int size_) {
    x = x_;
    y = y_;
    size = size_;
    particles = new ArrayList<Particle>();
    CreateRandom();
  }
  
  void CreateRandom(){
    int particlesCount = (int)random(2, 5);
    for (int i = 0; i < particlesCount; i++) {
      float px = random(size) - size / 2 + x;
      float py = random(size) - size / 2 + y;
      float ps = random(10,30);
      particles.add(new Particle(px, py, ps));
      
      // how many connection there would be
      //
       
    }
    
    int conCount = 1;
    joints = new DistanceJoint[particlesCount];
    for(int c = 0; c < particles.size() - 1; c++) {
      DistanceJointDef jointDef = new DistanceJointDef();
      jointDef.bodyA = particles.get(c).body;
      jointDef.bodyB = particles.get(c + 1).body;
      jointDef.length = box2d.scalarPixelsToWorld(100);
      jointDef.frequencyHz = 3;
      jointDef.dampingRatio = 0.5;
      DistanceJoint joint = (DistanceJoint) box2d.world.createJoint(jointDef);
      joints[0] = joint;
      
    }
    
  }
  
  void display() {
    for (int i = 0; i < particles.size(); i++)
    particles.get(i).display();
    
    stroke(255, 64, 64);
    strokeWeight(5);
    for(int i = 0; i < particles.size() - 1; i++) {
      Vec2 v1 = box2d.getBodyPixelCoord(particles.get(i).body);
      Vec2 v2 = box2d.getBodyPixelCoord(particles.get(i + 1).body);
      line(v1.x, v1.y, v2.x, v2.y);
    }
  }
}