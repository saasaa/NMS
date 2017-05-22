module parameter
  !-----------------------------------------------------------
  !  Module pendpar contains the parameters of the driven
  !  pendulum
  !-----------------------------------------------------------
  use iso_fortran_env, only : real64, int64
  implicit none

  integer (int64), parameter :: Nrmax = 2000
  integer (int64), parameter :: NEmax = 40000

  real (real64), parameter :: PI = 4 * atan (1.0_real64)
  real (real64), parameter :: hbar=6.582122e-22_real64 ! MeVs
  real (real64), parameter :: hbaratto=6.582122e-4_real64 ! MeVas



  real (real64), parameter :: mass_of_neutron=939.56563_real64  ! MeV
  real (real64), parameter :: atomic_mass_unit=931.49432_real64     ! MeV
  real (real64), parameter :: hbar_times_c=197.327053_real64  ! MeVfm

  integer (int64), parameter :: A = 40  !  mass number of target
  real (real64), parameter :: mA = 39.962591_real64  ! rel. atomic mass of target nucleus
  real (real64), parameter :: Anorm = 1._real64     ! start normalization of wave function
  real (real64), parameter :: energy_max = 1000._real64  ! maximal energy in MeV
  real (real64), parameter :: radius_max = 30._real64
  integer (int64), parameter :: number_of_meshpoints = 2000

  !Potential parameters
  real (real64), parameter :: V0 = 84._real64 ! MeV
  real (real64), parameter :: rr = 1.20_real64 !fm
  real (real64), parameter :: a0 = 0.6_real64 !fm

  ! parameters of additiona Gauss potential
  !real (real64), parameter :: V1 = 18._real64 !MeV
  real (real64), parameter :: V1 = 0._real64 !MeV
  real (real64), parameter :: R1 = 6.00_real64 !fm
  real (real64), parameter :: a1 = 4.0_real64 !fm**2

  !argand
  complex (real64), parameter :: ci=(0,1)
  complex (real64), dimension(NEmax) :: S
  real (real64), parameter :: alpha = 0.02_real64

  ! derived quantities
  real (real64), parameter :: reduced_mass = &
       &mass_of_neutron*mA*atomic_mass_unit/(mA*atomic_mass_unit+mass_of_neutron) !MeV
  real (real64), parameter :: mhb2 = 2._real64*reduced_mass/(hbar_times_c**2)

  real (real64), parameter :: energy_step = energy_max/NEmax
  real (real64), parameter :: stepsize_r = radius_max/Nrmax
  real (real64), parameter :: R0 = rr*A**(1._real64/3._real64)


  ! private
  ! public :: eta
  ! public :: reduced_force
  ! public :: driver_frequency
  ! public :: natural_frequency_squared
  ! public :: stepsize_time
  ! public :: mass_of_pendulum
  ! public :: natural_frequency
  ! public :: h_bar_times_omega0
  ! public :: length_of_pendulum

end module parameter
