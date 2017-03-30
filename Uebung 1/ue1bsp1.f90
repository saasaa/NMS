PROGRAM extremwerte
  implicit none
  double precision, parameter :: xintervallmin = -0.5
  double precision, parameter :: xintervallmax = 2
  integer, parameter :: expSchritt = 6
  double precision h, xarg, y, n
  integer :: i,j,nanzahl

  double precision :: xminFeld(expSchritt),xmaxFeld(expSchritt)
  double precision :: yminFeld(expSchritt),ymaxFeld(expSchritt)
  !Initialisieren:
  i=0;  j=0;  y=0
  forall (i=1:expSchritt) xminFeld(i) = xintervallmin
  forall (i=1:expSchritt) xmaxFeld(i) = xintervallmin

  forall (i=1:expSchritt) yminFeld(i) = cos(xintervallmin)*&
       &xintervallmin*xintervallmin
  forall (i=1:expSchritt) ymaxFeld(i) = cos(xintervallmin)*&
       &xintervallmin*xintervallmin

  write(*,*) '# Exponent,   xmin,   ymin,   xmax,   ymax   '
  do j=1, expSchritt
     !Berechnung der Schrittweite:
     h=1./(10**(j))
     !wie of ist die Schrittweite im Intervall enthalten?
     n=(xintervallmax-xintervallmin)/h
     nanzahl=nint(n) !!NINT(A) rounds its argument to the nearest whole number.

     do i=0, nanzahl
        xarg = xintervallmin+(i*h)   ! berechnen des arguments nur einmal pro schritt
        y=cos(xarg)*xarg*xarg
        !write(*,*) xarg , y
        if( y >= ymaxFeld(j) ) then
           ymaxFeld(j) = y
           xmaxFeld(j) = xarg
        else if ( y <= yminFeld(j) ) then
           yminFeld(j) = y
           xminFeld(j) = xarg
        end if
     end do
  end do
  !
  do j=1, expSchritt
     write(*,*) j, xminFeld(j), yminFeld(j), xmaxFeld(j), ymaxFeld(j)
  end do

end PROGRAM extremwerte
