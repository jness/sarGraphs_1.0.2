#!/bin/sh
gnuplot << EOF

set terminal png size 500,300
set output "./reports/$2-cpu.png"
set style data linespoints
set title "CPU Idle Time for `hostname` on $2"

set xdata time
set timefmt "%H:%M:%S"
#set format x "%H:%M"
set format x "%H"

set xlabel "Time"
set ylabel "Percent"

plot "$1" using 1:3 title "cpu idle time"

EOF
cp ./reports/$2-cpu.png ./reports/current-cpu.png
