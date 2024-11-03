set terminal png size 1280,941 crop
set output 'testimagine'

set xlabel "Time [sec]"
set ylabel "Radius [m]"
set title "my first plot with gnuplot"

plot sin(x)/x
