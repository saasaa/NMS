module parameter
  !-----------------------------------------------------------
  !  Module pendpar contains the parameters of the driven
  !  pendulum
  !-----------------------------------------------------------
  use iso_fortran_env, only : real64, int64
  implicit none

  integer (int64), parameter :: NMax = 50 ! Maximal lattice size,
  integer (int64), parameter :: NN = 4! # neighbors

  real (real64), parameter :: JJ = 1._real64 !Coupling constant
  real (real64), parameter :: HH = 0._real64 ! Magnetic field

  integer (int64) :: s, d !Lattice

  real (real64) :: energy !Total lattice

  integer (int64), dimension(NN), parameter :: Inn = [1,-1,0,0] ! Nearest neighbor array I

  integer (int64) :: Inew, Jnew ! Nearest neighbour indices

  real (real64) :: Etemp, deltaE ! Temp energy variables for MC moves

  integer (int64) :: accept !Number of accepted moves
  integer (int64) :: move !Number of moves total

  real (real64) :: T ! temperature (in units of J/k_B)
  integer (int64) :: o
  real (real64) :: beta

  integer (int64) :: sweeps ! number of measurement sweeps
  integer (int64) :: warm ! number of warm-up sweeps */

  integer (int64) :: L ! lattice dimension

  real (real64) :: rn, r !Random
  real (real64), parameter :: kb=1._real64 ! Boltzmann
  real (real64) :: nsum, msum, esum



end module parameter
