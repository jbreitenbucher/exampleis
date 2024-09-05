#include "Simulation.h"


Simulation::Simulation(int _steps, double H) {
  noise = new Noise2(_steps);
  motion = new Motion(noise);
}

Simulation::~Simulation() {
  delete noise;
  delete motion;
}

void Simulation::Analyze() {
  noiseplotter.MakePlot("noise");
  motionplotter.MakePlot("motion");  
}
