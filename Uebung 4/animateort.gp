reset
set term gif animate optimize
set output "wellenfunktionOrtsraum.gif"
n=900  #n frames

set sample 2000

set grid
set key outside center bottom
#set xrange [400:800]


set yrange [0:0.6]
do for [i=0:n]{
plot 'wfkterg/matrix.dat'  matrix  using 1:3 every 1:1024:1:i w lines title "Wellenfunktion |Psi(x)|^2" , 'wfkterg/pot.dat' u 0:2 w lines title "Potentialbarriere - reskaliert"
i=i+10
}

set output
