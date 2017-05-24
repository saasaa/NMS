set term pdf #enhanced
set out 'ising.pdf'

#set sample 10000
set key
set grid

#set title "|M|"
set key outside top center
set yrange [0:1.1]

set xlabel "Temperatur"
set ylabel "|M|"

plot "m_msqared4x4.dat" u 1:2  title "|M| - 4x4 Lattice" ps .5,  "m_msqared12x12.dat" u 1:2  title "|M| - 12x12 Lattice" ps .5, "m_msqared20x20.dat" u 1:2  title "|M| - 20x20 Lattice"  ls 12 ps .5

set ylabel "<M>^2"


plot "m_msqared4x4.dat" u 1:3  title "<M>^2 - 4x4 Lattice" ps .5,  "m_msqared12x12.dat" u 1:3  title "<M>^2 - 12x12 Lattice" ps .5, "m_msqared20x20.dat" u 1:3  title "<M>^2 - 20x20 Lattice"  ls 12 ps .5

set ylabel "<M>^4"

plot "m_msqared4x4.dat" u 1:3  title "<M>^2 - 4x4 Lattice" ps .5,  "m_msqared12x12.dat" u 1:3  title "<M>^2 - 12x12 Lattice" ps .5, "m_msqared20x20.dat" u 1:3  title "<M>^2 - 20x20 Lattice"  ls 12 ps .5

set ylabel "<M>^4"

plot "msqaredbiquardatic_binder_ku4x4.dat" u 1:2  title "<M>^4 - 4x4 Lattice" ps .5,  "msqaredbiquardatic_binder_ku12x12.dat" u 1:2  title "<M>^4 - 12x12 Lattice" ps .5, "msqaredbiquardatic_binder_ku20x20.dat" u 1:2  title "<M>^4 - 20x20 Lattice" ls 4  ps .5

unset yrange

set ylabel "1-1/3 * <M>^4 / <M^2>^2 "


plot "msqaredbiquardatic_binder_ku4x4.dat" u 1:3  title "Binder-Kumulante - 4x4 Lattice" ps .5,  "msqaredbiquardatic_binder_ku12x12.dat" u 1:3  title "Binder-Kumulante - 12x12 Lattice" ps .5, "msqaredbiquardatic_binder_ku20x20.dat" u 1:3  title "Binder-Kumulante - 20x20 Lattice" ls 6  ps .5



unset out
unset term

#plot 'data.dat' index i matrix with image using 1:3 every 1:999:1:2
