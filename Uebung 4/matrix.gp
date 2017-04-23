set term pdfcairo #enhanced
set out 'ortsraum3dplot.pdf'

#set sample 10000
unset key

set title "Wellenfunktion im Ortsraum -- logarithmisch"

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
#set log cb
set cbrange [1E-3:]

plot "wfkterg/matrix.dat" matrix u (($1-256)*100/512):2:3 title " " w image

unset out
unset term
