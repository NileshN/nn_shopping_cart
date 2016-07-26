set term png
set out 'result-CPriorityQueue.png'
set xlabel 'Number of nodes'
set ylabel 'Time in seconds (real)'
set logscale xy
set title 'Dijkstras Shortest Path Algorithm on Networks of different degrees'
plot \
  'results.csv' using 1:2 with lines title "CPriorityQueue (Graph of Degree: 16)"
