set term pdfcairo #enhanced
set out 'argand.pdf'

#set sample 10000
unset key
set grid

set title "V_1=0, l=2"


set xlabel "Re[S]"
set ylabel "Im[S]"

plot "argand_l=2_v1=0.dat" u 1:2 w lines

set title "V_1=18 MeV, l=2"

plot "argand_l=2_v1=18.dat" u 1:2 w lines


unset out
unset term

#plot 'data.dat' index i matrix with image using 1:3 every 1:999:1:2
