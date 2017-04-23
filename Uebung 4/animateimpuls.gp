reset
set term gif animate# optimize
set output "wellenfunktionImpulsraum.gif"
n=900  #n frames

#set sample 2000

set grid
set key outside center bottom
#set xrange [28:228]


#set yrange [0:1]
do for [i=0:n]{
plot 'wfkterg/impuls.dat'  matrix  using 1:3 every 1:1024:1:i w lines title "Wellenfunktion |Psi(k)|^2"
}


set output
