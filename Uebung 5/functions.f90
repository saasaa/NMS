module functions
  use iso_fortran_env
  implicit none
  private
  public T, TSumme
contains

  !
  pure real (real64) function T(l,deltax_inv,ndim_inv)
    real (real64), parameter :: PI_16 = 4 * atan (1._real64)
    integer (int64), intent(in) :: l
    real (real64), intent(in) :: deltax_inv, ndim_inv
    T = 2*(PI_16*l*ndim_inv*deltax_inv)**2
  end function T

  !T(l=1,deltax_inv=deltax_inv,ndim_inv=n_dim_inv)

  pure real (real64) function Tsumme(ndim,i,j,deltax_inv,ndim_inv)
    real (real64), parameter :: PI_16 = 4 * atan (1._real64)
    real (real64), intent(in) :: deltax_inv, ndim_inv
    integer (int64), intent(in) :: ndim,i,j
    integer (int64) :: l
    real (real64) :: hilf
    hilf = 0._real64

    do l = 1, ndim/2, 1
       hilf = T(l=l,deltax_inv=deltax_inv,ndim_inv=ndim_inv)*&
            &cos(2*PI_16*l*(i-j)*ndim_inv) + hilf
    end do

    Tsumme = hilf

  end function TSUMME


end module functions
