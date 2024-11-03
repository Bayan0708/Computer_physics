set terminal png size 1280,941 crop
set output "testimagine2"
set title 'Graph of velocity versus time'
set xlabel 'Time/s'
set ylabel 'Velocity/ms^{-1}'
set xrange[0.1:7] 
set mxtics 4
set grid
set logscale y
plot 2*x title velocity
