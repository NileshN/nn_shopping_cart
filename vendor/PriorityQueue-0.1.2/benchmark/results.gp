set term png
set out 'results.png'
set xlabel 'Number of nodes'
set ylabel 'Time in seconds (real)'
set logscale xy
set title 'Dijkstras Shortest Path Algorithm using different PQ Implementations'
plot \
  'results.csv' using 1:2 with lines title "CPriorityQueue (Graph of Degree: 16)",\
  'results.csv' using 1:3 with lines title "RubyPriorityQueue (Graph of Degree: 16)"
