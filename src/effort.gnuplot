# source: http://www.phyast.pitt.edu/~zov1/gnuplot/html/contour.html

set terminal pdf
set output "effort.pdf"

# create data file
reset
f(x,y)=sin(1.3*x)*cos(.9*y)+cos(.8*x)*sin(1.9*y)+cos(y*.2*x)
set xrange [0:10]
set yrange [0:10]
set isosample 250, 250
set table 'effort.dat'
splot f(x,y)
unset table

# create contour datafile
set contour base
set cntrparam level incremental -3, 0.5, 3
unset surface
set table 'effort_contours.dat'
splot f(x,y)
unset table

# plot
reset
set xrange [0:10]
set yrange [0:10]
set xlabel "Buildings"
set ylabel "Applications"
unset key
set palette rgbformulae 33,13,10
p 'effort.dat' with image, 'effort_contours.dat' w l lt -1 lw 1.5

