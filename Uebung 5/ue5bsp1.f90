program ue5
  use iso_fortran_env
  use functions, only: t, tsumme

  implicit none

  integer (int64) :: i,j,k,fail
  real (real64), parameter :: pi_16 = 4 * atan (1.0_real64)
  integer (int64), parameter :: n_dim = 200!dimension vom n
  real (real64) :: n_dim_inv
  real (real64) :: deltax_inv

  !real (real64) :: psi(n_dim), psihilf(n_dim)
  real (real64), dimension(n_dim,n_dim) :: einheitsmatrix, laplacematrix
  real (real64), dimension(n_dim,n_dim) :: hamiltonmatrix, potentialmatrix

  real (real64), dimension(n_dim) ::  v, v0, b, ew
  real (real32), dimension(n_dim) :: psifourierconv, psifourier
  real (real64) :: deltax

  real (real64) :: energie

  real (real64), dimension(17408) :: work


  deltax = 25._real64/n_dim
  n_dim_inv = 1._real64/n_dim
  deltax_inv = 1._real64/deltax
  hamiltonmatrix=0._real64
  potentialmatrix = 0._real64


  !potential 2
  forall(i=1:n_dim) potentialmatrix(i,i)= &
       & -1._real64/(1+abs(deltax*(i-n_dim*0.5_real64)))



  open(20, file='hamiltonmatrix.dat', status='replace')


  do j = 1, n_dim, 1
     do i = 1, n_dim, 1
        hamiltonmatrix(i,j) = (2*n_dim_inv*&
             &tsumme(ndim=n_dim,&
             &i=i,j=j,&
             &deltax_inv=deltax_inv,&
             &ndim_inv=n_dim_inv))
     end do
  end do


  hamiltonmatrix = hamiltonmatrix + potentialmatrix
  do i=1, n_dim, 1
     write(20,*) (hamiltonmatrix(i,j) , j=1,n_dim)
  end do

  close(20, status='keep')
  work = 0
  fail = 0

  call dsyev 	('v',& !jobz
       & 'u',& !uplo
       & n_dim, & !n
       & hamiltonmatrix, &  !a
       & n_dim, & ! lda
       & ew, & ! w
       & work, & !work
       & 17408, & !lwork
       & fail) !info

write(*,*) "fail:", fail

  open(21, file='eigenwerte.dat', status='replace')

  do i=1,5
     write(21,*) ew(i)
    write(*,*) ew(i)
     !write(21,*) hamiltonmatrix(i,3)
  end do

  close(21, status='keep')

  open(22, file='eigenvek.dat', status='replace')
  
  do i=1, n_dim
    write(22,*) (hamiltonmatrix(i,j),j=1,n_dim)    !EIGENVEKTOREN
  end do 

  close(22, status='keep')

end program ue5

