PROGRAM fixpunkt
  implicit none
  double precision xstart, delta
  double precision xi(101)
  integer i, abbruch
  xstart=2.5
  delta = 1./10**(6)
  forall (i=1:101) xi(i)=0

  xi(1)=xstart

  do i=1, 101

     xi(i+1) = 2./tan(xi(i))
     !write(*,*) xi(1)
     if((abs(xi(i+1)-xi(i))< delta) .AND. (abs(xi(i)-xi(i-1))< delta)) then
        write (*,*) "#abgebrochen bei i=", i
        abbruch = i
        exit
     else if (xi(i+1)>3 .OR. xi(i+1)<-3) then
        write (*,*) "#out of bounds"
        abbruch=i
        exit
     end if
     !write(*,*) xi(i)
  end do
  write (*,*) "#  x, xi "
  do i=1, abbruch
     write (*,*) xi(i), xi(i+1)
  end do

  write(*,*) "#abbruch=", abbruch

end PROGRAM fixpunkt
