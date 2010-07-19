#!/bin/sh
gnuplot << EOF

set terminal png size 500,300
set output "./reports/$2-io.png"
set style data linespoints
set title "I\/O Wait for `hostname` on $2"

set xdata time
set timefmt "%H:%M:%S"
#set format x "%H:%M"
set format x "%H"

set xlabel "Time"
set ylabel "Disk I\/O"

plot "$1" using 1:4 title "disk i\/o"

EOF
cp ./reports/$2-io.png ./reports/current-io.png
