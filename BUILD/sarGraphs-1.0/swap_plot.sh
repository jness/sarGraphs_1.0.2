#!/bin/sh
gnuplot << EOF

set terminal png size 500,300
set output "./reports/$2-swap.png"
set style data linespoints
set title "Swap Usage for `hostname` on $2"

set xdata time
set timefmt "%H:%M:%S"
#set format x "%H:%M"
set format x "%H"

set xlabel "Time"
set ylabel "Percent"

plot "$1" using 1:4 title "swap"
EOF
cp ./reports/$2-swap.png ./reports/current-swap.png
