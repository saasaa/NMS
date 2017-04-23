MODULE functions
  USE iso_fortran_env
  IMPLICIT NONE
  PRIVATE
  PUBLIC T, TSumme
CONTAINS

  !
  PURE REAL (real64) FUNCTION T(l,deltax_inv,ndim_inv)
    REAL (real64), PARAMETER :: PI_16 = 4 * ATAN (1._real64)
    INTEGER (int64), INTENT(in) :: l
    REAL (real64), INTENT(in) :: deltax_inv, ndim_inv
    T = 2*(PI_16*l*ndim_inv*deltax_inv)**2
  END FUNCTION T

  !T(l=1,deltax_inv=deltax_inv,ndim_inv=n_dim_inv)

  PURE REAL (real64) FUNCTION Tsumme(ndim,i,j,deltax_inv,ndim_inv)
    REAL (real64), PARAMETER :: PI_16 = 4 * ATAN (1._real64)
    REAL (real64), INTENT(in) :: deltax_inv, ndim_inv
    INTEGER (int64), INTENT(in) :: ndim,i,j
    INTEGER (int64) :: k
    REAL (real64) :: hilf
    hilf = 0._real64

    DO k = 1, ndim/2, 1
       hilf = T(l=k,deltax_inv=deltax_inv,ndim_inv=ndim_inv)*&
            &COS(2*PI_16*k*(i-j)*ndim_inv) + hilf
    END DO

    Tsumme = hilf

  END FUNCTION TSUMME




END MODULE functions
