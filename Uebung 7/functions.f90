module functions
  use iso_fortran_env, only : real64, int64
  implicit none

  private
  public :: trapezint

contains

  real (real64) function trapezint(array,ndim,startintervall,endintervall,ersterindex,letzterindex) result(res)
    integer (int64) :: i
    integer (int64), intent(in) :: ndim
    integer (int64), optional, intent(in) :: ersterindex,letzterindex
    real (real64), dimension(ndim), intent(in) :: array
    real (real64), intent(in) :: startintervall,endintervall
    integer (int64) :: startwert,endwert
    real (real64) :: hilf, schrittweite

    if ((present(ersterindex) .AND. present(letzterindex))) then
       startwert = ersterindex
       endwert   = letzterindex
    else if (present(ersterindex)) then
       startwert = ersterindex
       endwert = ndim
    else if (present(letzterindex)) then
       startwert = 1_int64
       endwert = letzterindex
    else
       startwert = 1_int64
       endwert   = ndim
    endif


    schrittweite = (endintervall-startintervall)/ndim

    hilf = 0.

    do i = startwert, endwert, 1
       if(i == startwert .OR. i == endwert) then
          hilf = hilf + array(i)*0.5_real64
       else
          hilf = hilf + array(i)
       end if
    end do

    res = hilf*schrittweite
    !
  end function trapezint

end module functions
