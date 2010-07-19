#!/bin/sh
gnuplot << EOF

set terminal png size 500,300
set output "./reports/$2-network.png"
set style data linespoints
set title "Network Utilization for `hostname` on $2"

set xdata time
set timefmt "%H:%M:%S"
#set format x "%H:%M"
set format x "%H"

set xlabel "Time"
set ylabel "Bytes"

plot "$1" using 1:3 title "incoming", \
"" using 1:4 title "outgoing"
EOF
cp ./reports/$2-network.png ./reports/current-network.png
