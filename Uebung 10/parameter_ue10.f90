module parameter_ue10

use iso_fortran_env, only : real64, int64

implicit none

integer (int64) :: ios, ioerr

integer (int64), parameter :: Nimax = 254_int64
integer (int64), parameter :: Njmax = 333_int64

integer (int64), parameter :: number_of_neighbours = 4_int64

real (real64), parameter :: coupling_constant = 3._real64!1._real64
real (real64), parameter :: H_field = 0._real64

integer (int64), dimension(Nimax,Njmax) :: MR_image
integer (int64), dimension(Nimax,Njmax) :: SA_image

!mean values and standard deviation
integer (int64), parameter, dimension(5) :: mean_values = &
&[30_int64, 426_int64 ,602_int64, 1223_int64, 167_int64]
integer (int64), parameter, dimension(5) :: sigma = &
&[30_int64, 59_int64 ,102_int64 ,307_int64, 69_int64]

integer (int64), parameter, dimension(number_of_neighbours) :: neighbours_i &
& = [ 1_int64,-1_int64,0_int64,0_int64]
integer (int64), parameter, dimension(number_of_neighbours) :: neighbours_j &
& = [ 0_int64,0_int64,1_int64,-1_int64]

real (real64) :: temperature
real (real64), parameter :: temperature_final = 0.1_real64
real (real64), parameter :: lambda = 1.5_real64
 
real (real64) :: beta
real (real64) :: energy
real (real64) :: energy_difference
real (real64) :: randomx, randomy, random, r

integer (int64) :: sweeps
integer (int64) :: brain_tissue_old
integer (int64) :: brain_tissue_new

integer (int64) :: random_lattice_point_x
integer (int64) :: random_lattice_point_y

end module parameter_ue10
