reset
set term gif animate
set output "wellenfunktion.gif"
n=500  #n frames

set sample 2000

set grid
set key outside center bottom
#set xrange [400:800]


set yrange [0:2.5]
do for [i=0:n]{
plot 'wfkterg/matrix.dat'  matrix  using 1:3 every 1:1024:1:i w lines title "Wellenfunktion Psi(x)" , 'wfkterg/pot.dat' u 0:2 w lines title "Potentialbarriere"
}


set output
