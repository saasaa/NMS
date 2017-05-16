set term pngcairo size 2000,1080
set output '3b)phase_space1.png'
#set title 'phasespace trajectories --  free pendulum'
set xlabel 'theta [rad]'
set ylabel 'theta dot [rad/s]'
set grid
plot 'ruku_eta0.01.dat' u 2:3 every 2 w lines title "eta = 0.01 1/s"
unset out
unset term

set term pngcairo size 2000,1080
set output '3b)phase_space2.png'
#set title 'phasespace trajectories --  free pendulum'
set xlabel 'theta [rad]'
set ylabel 'theta dot [rad/s]'
set grid
plot 'ruku_eta0.3.dat' u 2:3 every 2 w lines title "eta = 0.3 1/s"
unset out
unset term

set term pngcairo size 2000,1080
set output '3b)phase_space3.png'
#set title 'phasespace trajectories --  free pendulum'
set xlabel 'theta [rad]'
set ylabel 'theta dot [rad/s]'
set grid
plot 'ruku_eta0.5.dat' u 2:3 every 2 w lines title "eta = 0.5 1/s"
unset out
unset term

set term pngcairo size 2000,1080
set output '3b)phase_space4.png'
#set title 'phasespace trajectories --  free pendulum'
set xlabel 'theta [rad]'
set ylabel 'theta dot [rad/s]'
set grid
plot 'ruku_eta0.9.dat' u 2:3 every 2 w lines title "eta = 0.9 1/s"
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

plot 'fourier_eta0.01.dat' u 1:2 w lines title "eta = 0.01 1/s"  ,'fourier_eta0.3.dat' u 1:2 w lines title "eta = 0.3 1/s"  ,'fourier_eta0.5.dat' u 1:2 w lines title "eta = 0.5 1/s" ,'fourier_eta0.9.dat' u 1:2 w lines title "eta = 0.9 1/s"

unset out

unset term
