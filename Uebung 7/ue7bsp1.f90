program ue7
  use iso_fortran_env, only :  real64, int64, output_unit
  use functions, only :  runge_kutta, trapezint
  use pendulum_parameter, only : stepsize_time


  implicit none

  integer (int64) ::  i, j
  real (real64), parameter :: PI = 4 * atan (1.0_real64)
  integer (int64), parameter :: number_of_timesteps = 9000
  integer (int64), parameter :: number_of_omegasteps = 500

  ! real (real64), parameter :: stepsize_h = 2._real64 * PI/number_of_omegasteps

  real (real64), dimension(0:2) :: y,  z

  !real (real64), dimension(0:2) :: y, y_new


  !initial values

  real (real64), parameter :: initial_theta = PI*0.1_real64
  real (real64), parameter :: initial_theta_dot = 0._real64

  real (real64) :: om, Ft, Fi


  y = [0._real64, initial_theta, initial_theta_dot]

  open(2, file="ruku.dat", status='replace')


  do i = 1, number_of_timesteps, 1
     y = runge_kutta(y, stepsize_time, timestep = i)
     write(2,*)  y
  end do

  open(3,file='ft.dat',form='formatted')
  rewind 3
  do i=1,number_of_omegasteps-1
     rewind 2
     om=i*0.002_real64
     read(2,*)z
     Ft=cos(om*z(0))*z(1)/2.d0
     Fi=sin(om*z(0))*z(1)/2.d0
     do j=1,number_of_timesteps-1
        read(2,*)z
        Ft=Ft+cos(om*z(0))*z(1)
        Fi=Fi+sin(om*z(0))*z(1)
     end do
     Ft=Ft-cos(om*z(0))*z(1)/2.d0
     Fi=Fi-sin(om*z(0))*z(1)/2.d0
     Fi= stepsize_time * Fi
     FI=Fi/(2.d0*PI)
     Ft= stepsize_time * Ft
     Ft=Ft/(2.d0*PI)
     write(3,*) om, Ft, Fi, Ft*Ft+Fi*Fi! Fi, Ft*Ft+Fi*Fi
  end do

  close (2, status='keep')
  close (3, status='keep')


end program ue7
