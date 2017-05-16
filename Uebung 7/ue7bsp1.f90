program ue7
  use iso_fortran_env, only :  real64, real32, int64, output_unit
  use functions, only :  runge_kutta, trapezint, return_power
  use pendulum_parameter, only : stepsize_time,mass_of_pendulum, h_bar_times_omega0, length_of_pendulum


  implicit none

  integer (int64) ::  i,l, ioerr
  real (real64), parameter :: PI = 4 * atan (1.0_real64)
  integer (int64), parameter :: number_of_timesteps = 2._real64**14

  real (real64), dimension(0:2) :: y

  real(real32), dimension(number_of_timesteps) :: theta_values
  real(real32), dimension(number_of_timesteps) :: theta_values_fourier
  real(real64), dimension(number_of_timesteps) :: theta_values_real64
  real(real64), dimension(number_of_timesteps) :: theta_values_dot_real64

  !initial values

  real (real64), parameter :: initial_theta = PI*0.0_real64
  real (real64), parameter :: initial_theta_dot = sqrt(h_bar_times_omega0/(mass_of_pendulum*length_of_pendulum**2)) * length_of_pendulum  !0._real64

  real (real64) ::  sampling_parameter


  theta_values = 0
  theta_values_fourier = 0
  l=0
  sampling_parameter = 2._real64*PI/(number_of_timesteps*stepsize_time)

  y = [0._real64, initial_theta, initial_theta_dot]

  open(21, file="ruku.dat", status='replace')


  do i = 1, number_of_timesteps, 1
     y = runge_kutta(y, timestep = i)
     write(21,*)  y(0), y(1), y(2)
     if (mod(i,number_of_timesteps/10)==0) then
        l=l+10
        write(output_unit,*) l, "%"
     end if
     theta_values(i) = real(y(1), real32)
     theta_values_real64(i) = y(1)
     theta_values_dot_real64 = y(2)
  end do

  close(unit=21, iostat=ioerr, status="keep")
  if ( ioerr /= 0 ) stop "Error closing file unit 3"

  call RPA(return_power(number_of_timesteps), theta_values, 1, theta_values_fourier, 1)
  !
  open(unit=22, file="6.7s.dat")
  if ( ioerr /= 0 ) stop "Error opening file "

  do i = 1, number_of_timesteps/2, 1
     write(22, *) sampling_parameter*i, theta_values_fourier(i)**2 + theta_values_fourier(i+number_of_timesteps/2)**2
  end do

  close(unit=22, status="keep")

  write(*,*) stepsize_time

  write(*,*)  maxval(theta_values_real64), maxval(theta_values_dot_real64), &
       &maxval(theta_values_real64)*maxval(theta_values_dot_real64)*Pi*mass_of_pendulum


end program ue7
