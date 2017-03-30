PROGRAM fixpunkta
  implicit none
  double precision :: xstart, delta
  double precision :: xi(101)
  integer :: i, abbruch
  !Initialisieren
  xstart=0
  delta = 1./10**(6)
  forall (i=1:101) xi(i)=0

  xi(1)=xstart

  do i=1, 101
     xi(i+1) = cos(xi(i))
     if((abs(xi(i+1)-xi(i))< delta) .AND. (abs(xi(i)-xi(i-1))< delta)) then
        write (*,*) "#abgebrochen bei i=", i
        abbruch = i
        exit
     end if
  end do

  write (*,*) "#  x, xi "
  do i=1, abbruch
     write (*,*)  xi(i), xi(i+1)
     ! write(*,*) abs(xi(i)-xi(i+1))
  end do

end PROGRAM fixpunkta
