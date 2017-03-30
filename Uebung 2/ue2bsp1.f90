! pause -1 GNUPLOT pause

PROGRAM ue2bsp1
  use iso_fortran_env
  use legendre_mod

  implicit none

  integer (int64) :: i

  write(*,*) "#7!!=", doublefact(7_int64)
  write(*,*) "# P(1,2,0.5)= ", legendre_rec(1_int64,2_int64,0.5_real64)
  write(*,*) "# P(4,3,x)= "
  do i = -100, 100, 1
     write(*,*) i/100._real64, legendre_rec(4_int64,3_int64,i/100._real64)
  end do


end PROGRAM ue2bsp1
