PROGRAM bsp4
  use iso_fortran_env
  use functions, only: T

  implicit none

  integer :: i,j,k
  real (real64), parameter :: PI_16 = 4 * atan (1.0_real64)
  integer (int64), parameter :: n_dim = 128!Dimension vom n
  real (real64) :: n_dim_inv
  real (real64) :: deltax_inv

  !real (real64) :: psi(n_dim), psihilf(n_dim)
  real (real64), dimension(n_dim,n_dim) :: einheitsmatrix, laplacematrix
  real (real64), dimension(n_dim,n_dim) :: hamiltonmatrix, potentialmatrix

  real (real64), dimension(n_dim) ::  psi, psihilf
  real (real32), dimension(n_dim) :: psifourierconv, psifourier
  real (real64) :: deltax
  real (real64) :: deltat
  real (real64) :: energie



  deltax = 20._real64/n_dim
  deltat = 0.1_real64/n_dim
  potentialmatrix = 0
  n_dim_inv = 1._real64/n_dim
  deltax_inv = (n_dim/20._real64)

  !POTENTIAL 1
  !forall(i=1:n_dim) potentialmatrix(i,i)= &
  !   & -1._real64/sqrt(2+(deltax*(i-n_dim*0.5))**2)

  !POTENTIAL 2
  forall(i=1:n_dim) potentialmatrix(i,i)= &
       & -1._real64/(1+abs(deltax*(i-n_dim*0.5_real64)))


  einheitsmatrix=0
  forall(i=1:n_dim) einheitsmatrix(i,i) =   1._real64

  write(output_unit, *) T(l=1,deltax_inv=deltax_inv,ndim_inv=n_dim_inv) 


  do j = 1, 100, 1
     do i = 1, 100, 1
        hamilton(i,j) = ()
     end do
  end do




end PROGRAM bsp4
