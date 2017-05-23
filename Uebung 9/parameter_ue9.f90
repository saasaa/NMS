module parameter_ue9

  use iso_fortran_env, only : real64, int64
  implicit none


  integer (int64) :: size_of_lattice
  integer (int64), parameter :: number_of_neighbours = 6_int64

  real (real64), parameter :: coupling_constant = 1._real64
  real (real64), parameter :: H_field = 0._real64

  integer (int64), dimension(:,:), allocatable :: ising_lattice


  integer (int64), parameter, dimension(number_of_neighbours) :: neighbours_i &
       & = [ 1_int64, 1_int64, 0_int64, -1_int64, -1_int64, 0_int64]

  integer (int64), parameter, dimension(number_of_neighbours) :: neighbours_j &
       & = [ 0_int64, -1_int64, -1_int64, 0_int64, 1_int64, 1_int64]

  real (real64) :: temperature
  real (real64) :: beta
  real (real64) :: energy
  real (real64) :: magnetization
  real (real64) :: magnetization_sum
  real (real64) :: magnetization_sum_squared
  real (real64) :: magnetization_sum_biquadratic
  real (real64) :: binder_kumulante


  integer (int64) :: size_of_lattice_squared
  integer (int64) :: size_of_lattice_biquadratic
  integer (int64) :: size_of_lattice_zenzizenzizenzic



  integer (int64) :: warmup_sweeps
  integer (int64) :: sweeps



end module parameter_ue9
