set term pdfcairo #enhanced
set out 'time_delay.pdf'

#set sample 10000
unset key
set grid

set title "timedelay: V_1=18, l=2"


set xlabel "Energy [MeV]"
set ylabel "time [as]"

set logscale xy

plot "time_delay_v1=18.dat" u 1:2 w lines




unset out
unset term

#plot 'data.dat' index i matrix with image using 1:3 every 1:999:1:2
