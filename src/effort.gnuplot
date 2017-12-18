# source: http://www.phyast.pitt.edu/~zov1/gnuplot/html/contour.html

set term pdfcairo font "Times-New-Roman,12"
set output "effort.pdf"

# view
building_min =  1
building_max = 10
application_min =  1
application_max = 10

# formula
points_per_application_site = 5
application_sites_per_buildings = 20
points_per_building = points_per_application_site * application_sites_per_buildings
cost_realization            = 24*60*60
cost_production(pointcount) = 10*60*pointcount
cost_hardcoded(applications, buildings) = cost_realization \
                                        + cost_production(buildings*points_per_building) \
                                        + 0 \
                                        + applications*buildings*points_per_building*60
cost_bricked(applications, buildings)   = cost_realization \
                                        + cost_production(buildings*points_per_building) \
                                        + 0 \
                                        + applications*points_per_application_site*60 \
                                        + buildings*points_per_building*60

# create data file
reset
f(x,y) = 1/ ( cost_bricked(y, x) / cost_hardcoded(y, x) )
set xrange [building_min:building_max]
set yrange [application_min:application_max]
set isosample 250, 250
set table 'effort.dat'
splot f(x,y)
unset table

# create contour datafile
set contour base
set cntrparam level incremental 0, 0.1, 10
unset surface
set table 'effort_contours.dat'
splot f(x,y)
unset table

# plot
reset
set xrange [building_min:building_max]
set yrange [application_min:application_max]
set xlabel "Buildings"
set ylabel "Applications"
unset key
set palette defined ( 0 '#ff0000',\
                      2 '#00ff00')
plot 'effort.dat' with image, \
     'effort_contours.dat' w l lt -1 lw 1.0

