module pendulum_parameter
  !-----------------------------------------------------------
  !  Module pendpar contains the parameters of the driven
  !  pendulum
  !-----------------------------------------------------------
  use iso_fortran_env, only : real64, int64
  implicit none

  real (real64), parameter :: PI = 4 * atan (1.0_real64)
  real (real64), parameter ::  gravitational_acceleration = 9.80665_real64


  real (real64), parameter :: length_of_pendulum = 2.451662499_real64   !meter
  real (real64), parameter :: mass_of_pendulum = 0.01_real64            !kg
  real (real64), parameter :: eta = 0._real64                          !1/s
  real (real64), parameter :: reduced_force = 0._real64                !1/s**2
  real (real64), parameter :: driver_frequency = 0._real64!2.1_real64             !1/s

  ! derived quantities

  real (real64), parameter :: natural_frequency_squared = &
       &gravitational_acceleration/length_of_pendulum
  real (real64), parameter :: natural_frequency = &
       &sqrt(gravitational_acceleration/length_of_pendulum)

  real (real64), parameter :: stepsize_time = PI/(natural_frequency*30._real64) ! Schrittweite 1/60. der Periode in s (dt)



  private
  public :: eta
  public :: reduced_force
  public :: driver_frequency
  public :: natural_frequency_squared
  public :: stepsize_time
  public :: mass_of_pendulum
  public :: natural_frequency

end module pendulum_parameter
