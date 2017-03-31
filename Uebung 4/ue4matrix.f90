PROGRAM uebsp4
  use iso_fortran_env
  implicit none

  integer :: i,j,l
  integer (int64), parameter :: n_dim = 512 !auch im output ändern
  integer (int64), parameter :: iter = 50000
  ! Matrizen für SGL
  real (real64), dimension(n_dim,n_dim) :: einheitsmatrix
  real (real64), dimension(n_dim,n_dim) :: potentialmatrix
  real (real64), dimension(n_dim,n_dim):: laplacematrix
  complex (real64), dimension(n_dim,n_dim) :: hamiltonforward, hamiltonback
  ! Wellenfunktionen
  complex (real64), dimension(n_dim) ::  psi, psihilf, psistart
  !Schrittweiten
  real (real64) :: deltax
  real (real64) :: deltat
  real (real64) :: sigma
  real (real64) :: k0
  complex (real64) :: complexarg

  real (real64), dimension(n_dim) ::  psibetr, psistartbetr
  !real (real64) :: istart, irechts, t



  ! Vektoren für Thomas Algorithmus
  complex (real64), dimension(n_dim) :: hamiltonfdiag
  complex (real64), dimension(n_dim) :: hamiltonfupper
  complex (real64), dimension(n_dim) :: hamiltonflower
  !real (real64), dimension(n_dim) :: x,d

  ! Initialisieren
  hamiltonfdiag     = 0._real64
  hamiltonfupper    = 0._real64
  hamiltonflower    = 0._real64
  potentialmatrix   = 0._real64
  einheitsmatrix    = 0._real64
  hamiltonforward   = 0._real64
  hamiltonback      = 0._real64
  psi               = 0._real64
  psihilf           = 0._real64

  !Festlegen der Schrittweiten
  !bei 1024 100
  deltax = 100._real64/n_dim
  deltat = 0.1_real64/n_dim
  sigma  = 1._real64
  k0     = 1._real64

  !Eineheitsmatrix besiedeln
  forall(i=1:n_dim) einheitsmatrix(i,i) = 1._real64

  !Laplacematrix aufstellen
  forall(i=1:n_dim)  laplacematrix(i,i)   =  -2._real64
  forall(i=2:n_dim)  laplacematrix(i-1,i) =  1._real64
  forall(i=2:n_dim)  laplacematrix(i,i-1) =  1._real64

  !POTENTIAL 2
  !forall(i=1:n_dim) potentialmatrix(i,i)= &
  !   & -1._real64/(1+abs(deltax*(i-n_dim*0.5_real64)))

  forall(i=nint(0.55*n_dim):nint(0.55*n_dim)+5) potentialmatrix(i,i)= 2._real64

  !forall(i=nint(0.55*n_dim):nint(0.55*n_dim)+30) potentialmatrix(i,i)= 0.5_real64



  !Anfangswellenfunktion
  !Wellenpaket:

  do i = nint(0.2*n_dim)+5, nint(0.8*n_dim), 1
     complexarg=dcmplx((-(deltax*(i-n_dim*0.5_real64))**2)/(2*sigma**2),deltax*(i-n_dim*0.5_real64)*k0)
     psi(i) = zexp(complexarg)
  end do

  psi=psi/sqrt(sum(psi**2*deltax))

  psistart = psi

  !Hamiltonmatrizen
  hamiltonforward = dcmplx(einheitsmatrix,&
       &(-0.5_real64*deltat*laplacematrix/(deltax**2) + deltat*potentialmatrix))

  hamiltonback = dcmplx(einheitsmatrix,&
       &(+0.5_real64*deltat*laplacematrix/(deltax**2) - deltat*potentialmatrix))



  ! Aufteilen der forward Hamiltonmatrix auf Vektoren
  call matrixsplit(hamiltonforward,hamiltonfdiag,hamiltonfupper,hamiltonflower,n_dim)


  open(30, file='wfkterg/matrix.dat', status='replace')
  open(26, file='wfkterg/pot.dat', status='replace')
  do i = 1, n_dim, 1
     write (26, *) deltax*(i-n_dim*0.5), potentialmatrix(i,i)
  end do
  close(26, status='keep')



  j=0
  l=10
  !Crank-Nicolson
  do i = 1, iter, 1
     psi = matmul(hamiltonback,psi)
     call TDMA(hamiltonfdiag,hamiltonfupper,hamiltonflower,psihilf,psi,n_dim)
     psihilf=psihilf/sqrt(sum(psihilf**2*deltax))
     psi = psihilf
     if ( mod(i,100)==0 ) then
        write(30,fmt="(512(F42.33))") (abs(psi(j))**2, j = 1, n_dim)
     end if
     if ( mod(i,iter/10)==0 ) then
        write(*,*) l, "%"
        l=l+10
     end if
  end do

  close(30, status='keep')

  psistartbetr = abs(psistart)**2
  psibetr = abs(psi)**2


end program uebsp4
