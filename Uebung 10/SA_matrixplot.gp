set term pdfcairo #enhanced
set out 'SA_plot.pdf'

#set sample 10000
unset key
unset xtics
unset ytics
unset colorbox

set title "Local"

#set palette rgbformulae 33,13,10
#set palette rgbformula -7,2,-7
set autoscale xfix
set autoscale yfix
#set autoscale cbfix

set palette defined (1 'white', 2 'blue', 3 'red',4 'yellow' ,5 'pink')


set size ratio -1

plot "SegSAmatrix.dat" matrix u 1:2:3 title " " w image

unset out
unset term
