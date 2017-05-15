set term pngcairo size 2000,1080
set output '3b)phase_space.png'


set title 'phasespace trajectories --  free pendulum'
set xlabel 'theta [rad]'
set ylabel 'theta dot [rad/s]'

set grid
plot 'ruku0.01.dat' u 2:3 every 2 w lines title "0.01pi", 'ruku0.1.dat' u 2:3 every 2  w lines title "0.1pi" , 'ruku0.5.dat' u 2:3 every 2  w lines title "0.5pi", 'ruku0.99.dat' u 2:3 every 2  w lines title "0.99pi"

unset out

unset term

set term pngcairo #size 2000,1080
set output '3b)fourier.png'

set logscale y
set format y "10^{%L}"
set xrange [:5]

set title 'Fourier Transform -- y-axis rescaled'
set xlabel 'omega'
set ylabel 'spectrum'

set grid

plot 'fourier0.01.dat' u 1:2 w lines title "0.01pi"  ,'fourier0.1.dat' u 1:(0.01*$2) w lines title "0.01pi"  ,'fourier0.5.dat' u 1:((1./50.)**2*$2) w lines title "0.5pi" ,'fourier0.99.dat' u 1:((1./99.)**2*$2) w lines title "0.99pi"

#plot 'fourier0.01.dat' u 1:2 w lines  ,'fourier0.1.dat' u 1:2 w lines  ,'fourier0.5.dat' u 1:2 w lines  ,'fourier0.99.dat' u 1:2 w lines


unset out

unset term
