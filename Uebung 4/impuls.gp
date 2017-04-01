set term pdfcairo #enhanced
set out 'impuls3dlogplot.pdf'

#set sample 10000
unset key

set title "Betragsquadrat der Wellenfunktion im Impulsraum -- gespiegelt, logarithmisch"

#set palette rgbformulae 33,13,10
#set palette rgbformula -7,2,-7
set autoscale xfix
set autoscale yfix
set autoscale cbfix

#set xrange [-20:20]


set pm3d
set pm3d map
set pm3d interpolate 0,0
set hidden3d
set log cb
#set cbrange [1E-3:]


plot "wfkterg/impuls.dat" matrix u 1:2:3 title " " w image


unset out
unset term

#plot 'data.dat' index i matrix with image using 1:3 every 1:999:1:2
