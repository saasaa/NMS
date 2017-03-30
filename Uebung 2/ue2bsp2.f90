!Die Funktion befindet sich in legendre.f90

PROGRAM ue2bsp2
  use iso_fortran_env
  use legendre_mod

  implicit none

  integer (int64) :: i,j
  integer (int64) :: l = 5_int64
  real (real64) :: funktionswerte(201,2)
  real (real64) :: koeffizienten(0:5)
  real (real64) ::  hilf, schrittweite, integral, fkt, x0

  open (unit=20, file="Funktion.dat", form="formatted")

  do i=1,201
     read(20,*) funktionswerte(i,1), funktionswerte(i,2)
  end do

  close ( 20, status='keep')

  schrittweite = 2._real64/200._real64

  !Integral über f(x)
  hilf =0.
  do i = 1, 201, 1
     if(i == 1 .OR. i == 201) then
        hilf = hilf + funktionswerte(i,2)*0.5_real64
     else
        hilf = hilf + funktionswerte(i,2)
     end if
  end do

  integral = hilf * schrittweite

  !Integral über P(l,0,x)*f(x) von l=0 bis l=5
  do j = 0, l, 1
     integral = 0.
     hilf = 0.
     fkt = 0.
     do i = 1, 201, 1
        fkt = funktionswerte(i,2) * legendre_rec(j,0_int64,funktionswerte(i,1))
        if(i == 1 .OR. i == 201) then
           hilf = hilf + fkt*0.5_real64
        else
           hilf = hilf + fkt
        end if
     end do
     koeffizienten(j) = (hilf*schrittweite)*(2*j+1)/2._int64
  end do


  x0=0

  do i = -100, 100, 1
     do j = 0, l, 1
        x0=x0+koeffizienten(j)*legendre_rec(j,0_int64,i/100._8)
     end do
     write(*,*) i/100._8, x0
     x0=0._real64
  end do

  write (*,*) "#", koeffizienten
end PROGRAM ue2bsp2
