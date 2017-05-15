set term pngcairo size 2000,1080
set output '3c)phase_space.png'


set title 'phasespace trajectories --  free pendulum'
set xlabel 'theta [rad]'
set ylabel 'theta dot [rad/s]'

set logscale x


set grid
p 'ruku_f1.dat' u 2:3 every 2  w lines title "f = 1 1/(s*s)" , 'ruku_f5.dat' u 2:3 every 2  w lines title "f = 5 1/(s*s)", 'ruku_f10.dat' u 2:3 every 2  w lines title "f = 10 1/(s*s)"
unset logscale x

unset out

unset term


set term pngcairo #size 2000,1080
set output '3c)fourier.png'

set logscale y
set format y "10^{%L}"
set xrange [:5]

set title 'Fourier Transform -- y-axis rescaled'
set xlabel 'omega'
set ylabel 'spectrum'

set grid

plot 'fourier_f1.dat' u 1:2 w lines title "f = 1 1/(s*s)"       , 'fourier_f5.dat' u 1:2 w lines title "f = 5 1/(s*s)"  ,          'fourier_f10.dat' u 1:2 w lines title "f = 10 1/(s*s)"

unset out

unset term
