PROGRAM ue5
  USE iso_fortran_env
  USE functions, ONLY: T, TSumme

  IMPLICIT NONE

  INTEGER (int64) :: i,j,k,fail
  REAL (real64), PARAMETER :: PI_16 = 4 * ATAN (1.0_real64)
  INTEGER (int64), PARAMETER :: n_dim = 128!Dimension vom n
  REAL (real64) :: n_dim_inv
  REAL (real64) :: deltax_inv

  !real (real64) :: psi(n_dim), psihilf(n_dim)
  REAL (real64), DIMENSION(n_dim,n_dim) :: einheitsmatrix, laplacematrix
  REAL (real64), DIMENSION(n_dim,n_dim) :: hamiltonmatrix, potentialmatrix

  REAL (real64), DIMENSION(n_dim) ::  v, v0, b, ew
  REAL (real32), DIMENSION(n_dim) :: psifourierconv, psifourier
  REAL (real64) :: deltax

  REAL (real64) :: energie

  REAL (real64), DIMENSION(34816) :: work


  deltax = 20._real64/n_dim
  n_dim_inv = 1._real64/n_dim
  deltax_inv = 1._real64/deltax
  hamiltonmatrix=0._real64
  potentialmatrix = 0._real64


  !POTENTIAL 2
  FORALL(i=1:n_dim) potentialmatrix(i,i)= &
       & -1._real64/(1+ABS(deltax*(i-n_dim*0.5_real64)))



  OPEN(20, file='hamiltonmatrix.dat', status='replace')


  DO j = 1, n_dim, 1
     DO i = 1, n_dim, 1
        hamiltonmatrix(i,j) = (2*n_dim_inv*&
             &Tsumme(ndim=n_dim,&
             &i=i,j=j,&
             &deltax_inv=deltax_inv,&
             &ndim_inv=n_dim_inv))
     END DO
  END DO


  hamiltonmatrix = hamiltonmatrix + potentialmatrix
  DO i=1, n_dim, 1
     WRITE(20,*) (hamiltonmatrix(i,j) , j=1,n_dim)
  END DO

  CLOSE(20, status='keep')
  work = 0
  fail = 0

  CALL dsyev 	('V',& !JOBZ
       & 'U',& !UPLO
       & n_dim, & !N
       & hamiltonmatrix, &  !A
       & n_dim, & ! LDA
       & ew, & ! W
       & work, & !WORK
       & 4352, & !LWORK
       & fail) !INFO


  OPEN(21, file='eigenwerte.dat', status='replace')

  DO i=1,n_dim
     WRITE(21,*) ew(i)
     !write(21,*) hamiltonmatrix(i,3)
  END DO

  CLOSE(21, status='keep')

  !Lanczos

  FORALL(i=1:n_dim) v(i)=1._real64

  v = v/SQRT(SUM((ABS(v)**2)))

  WRITE(*,*) DOT_PRODUCT(v,v)



END PROGRAM ue5
