#include "Motion.h"


Motion::Motion(int _steps) : TimeSeries(_steps) {}

Motion::Motion(Noise2 *_noise) : TimeSeries(_noise->GetSteps()) {
  noise = _noise;
}

Motion::~Motion() {
  delete noise;
}

void Motion::SyncWithNoise() {
  if (noise != NULL) {
    this->Initialize();
    double sum = 0;
    int getsteps = this->GetSteps();
    for (int i = 0; i < getsteps; i++) {
      sum += noise->GetData(i);
      this->SetData(i, sum);
    }
  } else {
    fprintf(stderr, "%s\n", MOTION_NOISE_ERR);
  }
} 

