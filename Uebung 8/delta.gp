set term pdfcairo #enhanced
set out 'delta.pdf'

#set sample 10000
unset key
set grid

set title "V_1=0, l=2"

set logscale x

set xlabel "absoute Streuphase [rad]"
set ylabel "Energie [MeV]"

plot "delta_l=2_v1=0.dat" u 1:2 w lines

set title "V_1=18 MeV, l=2"


plot "delta_l=2_v1=18.dat" u 1:2 w lines


set title "V_1=0 MeV, l=2, Streuphase"

plot "streu_delta_l=2_v1=0.dat" u 1:2 w lines

set title "V_1=18 MeV, l=2, Streuphase"

plot "streu_delta_l=2_v1=18.dat" u 1:2 w lines


unset out
unset term

#plot 'data.dat' index i matrix with image using 1:3 every 1:999:1:2
