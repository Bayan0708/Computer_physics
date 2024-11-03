set terminal png size 1280,941 crop
set output "testimagine1"


set title "Graph of velocity versus "
set xlabel "Time/s"
set ylabel "Velocity/ms^{-1}"
plot (x*sin(1.2*x))