MODULE legendre_mod
  use iso_fortran_env
  implicit none

CONTAINS

  pure integer (int64) function doublefact(n)
    integer (int64), intent(in) :: n
    integer (int64) ::  i, hilf
    hilf = n
    i =  n
    if(n == -1 .OR. n == 0) then
       doublefact = 1
       return
    else if ( n<-1 ) then
       doublefact = 0
       return
    end if

    do while(i>2)
       i=i-2
       hilf = hilf * i
    end do
    doublefact = hilf
  end function doublefact



  recursive pure real (real64) function legendre_rec(l,m,x)  result(res)
    implicit none
    integer (int64),  intent(in) :: l,m
    real (real64),  intent(in) :: x
    !initialisieren
    res = 0._real64
    if ( x>1 .OR. x<-1 .OR. m>l+1 ) then
       res = 0._real64
       !write (*,*) "nicht erlaubt"
       return
    end if

    if ( m==l+1 ) then
       res = 0._real64
    else if ( l==m ) then
       res =  doublefact(2*l-1) * (1-x*x)**(0.5_real64*l)
    else
       res = ((2*l-1)*x*legendre_rec(l-1,m,x) - (l+m-1)*legendre_rec((l-2),m,x))/(l-m)
    end if
  end function legendre_rec

END MODULE legendre_mod
