set term pdfcairo #enhanced
set out '3dplot.pdf'

#set sample 10000
unset key

set title "UE4"

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


#plot "/Users/Saasaa/MEGA/TPH 1337/NMS & WiProg/UE4/sshfs/wfkterg/matrix.dat" matrix u (($1-64)*100/128):2:3 title " " w image

#plot "wfkterg/matrix.dat" matrix u (($1-64)*100/128):2:3 title " " w image
plot "wfkterg/matrix.dat" matrix u 1:2:3 title " " w image


unset out
unset term

#plot 'data.dat' index i matrix with image using 1:3 every 1:999:1:2
