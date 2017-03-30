PROGRAM bsp3sas
  use iso_fortran_env
  implicit none

  integer :: i,j,k
  real (real64), parameter :: PI_16 = 4 * atan (1.0_real64)
  integer (int64), parameter :: n_dim = 1024!Dimension vom n
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

  !POTENTIAL 1
  !forall(i=1:n_dim) potentialmatrix(i,i)= &
  !   & -1._real64/sqrt(2+(deltax*(i-n_dim*0.5))**2)

  !POTENTIAL 2
  forall(i=1:n_dim) potentialmatrix(i,i)= &
       & -1._real64/(1+abs(deltax*(i-n_dim*0.5_real64)))


  einheitsmatrix=0
  forall(i=1:n_dim) einheitsmatrix(i,i) =   1._real64

  !laplacematrix
  laplacematrix = 0
  forall(i=1:n_dim)  laplacematrix(i,i)  =  -2._real64
  forall(i=2:n_dim)  laplacematrix(i-1,i)=  1._real64
  forall(i=2:n_dim)  laplacematrix(i,i-1)=  1._real64


  hamiltonmatrix = einheitsmatrix + 0.5_real64*deltat*laplacematrix/(deltax**2) -  deltat*potentialmatrix

  ! GRUNDZUSTAND
  !forall (i=1:n_dim) psi(i) = 1._real64
  forall (i=1:n_dim) psi(i) = exp(-0.005_real64*abs(i-n_dim*0.5_real64)**2)*0.6_real64
  ! ERSTER ANGEREGTER ZUSTAND
  !forall (i=1:n_dim) psi(i) = sin(PI_16*(i-n_dim*0.5_real64)/n_dim)*exp(-0.005_real64*abs(i-n_dim*0.5_real64)**2)*0.4

  forall(i=1:n_dim) psihilf(i)=0

  psi=psi/sqrt(sum(psi**2*deltax))


  open(20, file='psi1.dat')
  open(21, file='psi2.dat')
  open(22, file='psi3.dat')
  open(23, file='psi4.dat')
  open(24, file='psi5.dat')
  open(25, file='psi6.dat')

  j=0
  do k = 1, 132000, 1
     psihilf = matmul(hamiltonmatrix,psi)
     psihilf=psihilf/sqrt(sum(psihilf**2*deltax))
     if(Sum(abs((abs(psihilf)-abs(psi))**2*deltax))<(1d-13)) then
        write (25, *) "#Abgebrochen bei:", k
        exit
     end if
     psi = psihilf

     if (mod(k,22000) == 0) then
        write (20+j, *) "#",k,"iterationen"
        do i = 1, n_dim, 1
           write (20+j, *) deltax*(i-n_dim*0.5), psi(i)
        end do
        close (20+j, status='keep')
        j=j+1
     end if
  end do


  do i = 1, n_dim, 1
     write (25, *) deltax*(i-n_dim*0.5), psi(i)
  end do
  close (25, status='keep')

  !! Energieeigenwerte
  energie = deltax *&
       &dot_product(matmul((1/(deltax*deltax))*laplacematrix+potentialmatrix&
       &,psi),psi)

  write(*,*) energie

  psifourier = 0.
  psifourierconv = real(psi,4)

  open(26, file='fourieroutput.dat')
  open(27, file='fourieroutput2.dat')
  call RPA(10,psifourierconv,1,psifourier,1)

  !Ausgabe der Fouriertransformierten (erste hälfte des Arrays nur realteile)
  do i = -512, -1, 1
     write (26, *) i, psifourier(abs(i))
  end do

  do i = 1, 512, 1
     write (26, *) i, psifourier(i)
     !ausgabe des Betragsquadrats
     write(27,*) i-1, sqrt(psifourier(i)**2 +psifourier(i+512)**2)
  end do

  close(26, status='keep')
  close(27, status='keep')


end PROGRAM bsp3sas





!matrix ausgeben
! open(20, file='matrix.txt')
!
! write (20, *) laplacematrix
!
! close (20, status='keep')
