import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;
Organism organism;
Box ground;

void setup() {
  size(500, 300);
  smooth();

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  organism = new Organism(200, 50, 100);
  ground = new Box(width/2, height - 25, width, 50, true, color(14,165,9));
}

void draw() {
  background(117,213,227);
  box2d.step();
  organism.display();
  ground.display(false);
}