#!/bin/sh
gnuplot << EOF

set terminal png size 500,300
set output "./reports/$2-memory.png"
set style data linespoints
set title "Memory Usage for `hostname` on $2"

set xdata time
set timefmt "%H:%M:%S"
#set format x "%H:%M"
set format x "%H"

set xlabel "Time"
set ylabel "MB Used"

plot "$1" using 1:3 title "memory"
EOF
cp ./reports/$2-memory.png ./reports/current-memory.png
