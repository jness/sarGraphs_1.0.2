#!/bin/sh
gnuplot << EOF

set terminal png size 500,300
set output "./reports/$2-load.png"
set style data linespoints
set title "Load Averages for `hostname` on $2"

set xdata time
set timefmt "%H:%M:%S"
#set format x "%H:%M"
set format x "%H"

set xlabel "Time"
set ylabel "Load Average"

plot "$1" using 1:3 title "Load Average 1", \
"" using 1:4 title "Load Average 5", \
"" using 1:5 title "Load Average 15"
EOF
cp ./reports/$2-load.png ./reports/current-load.png
