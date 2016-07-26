set term png
set out 'result-RubyPriorityQueue.png'
set xlabel 'Number of nodes'
set ylabel 'Time in seconds (real)'
set logscale xy
set title 'Dijkstras Shortest Path Algorithm on Networks of different degrees'
plot \
  'results.csv' using 1:3 with lines title "RubyPriorityQueue (Graph of Degree: 16)"
