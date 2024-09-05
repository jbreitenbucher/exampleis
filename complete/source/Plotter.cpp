#include <unistd.h>
#include "Plotter.h"


void Plotter::MakePlot(char *filename) {
  ofstream fout(FILE_PLOT);
  fout << "set data style linespoints" << endl
       << "plot \"" << filename << "\"" << endl;
  fout.close();

  int pid, status;
  pid = fork();
  if (pid >= 0) {
    if (pid == 0) {
      execl(FILE_GNUPLOT, "gnuplot", "-persist", FILE_PLOT, NULL);
      fprintf(stderr, "%s \"gnuplot\"", EXEC_ERR);
      exit(0);
    } else {
      wait(status);
    }
  } else {
    fprintf(stderr, "%s \"gnuplot\"", FORK_ERR);
  }

  /*  pid = fork();
  if (pid >= 0) {
    if (pid == 0) {
      execlp("rm", FILE_PLOT, NULL);
      fprintf(stderr, "%s \"rm\"", EXEC_ERR);
      exit(0);
    } else {
      wait(status);
    }
  } else {
    fprintf(stderr, "%s \"rm\"", FORK_ERR);
    }*/

}
