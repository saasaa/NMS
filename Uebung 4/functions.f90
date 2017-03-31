module funktionen
  use iso_fortran_env
  implicit none

contains

  ! pure real (real64) function simpsonint(array,ndim,startwert,endwert) result(res)
  !     use iso_fortran_env
  !     implicit none
  !     integer (int64), intent(in) :: ndim,startwert,endwert
  !     real (real64), dimension(ndim), intent(in) :: array
  !
  !     if ( mod(endwert-startwert,2) /= 0 ) then
  !         res = - 1
  !     end if
  !
  ! end function

  !tridiagonale matrix in vektoren aufteilen
  subroutine matrixsplit(matrix,diagonalelements,upperelements,lowerelements,ndim)

    integer (int64) :: i
    integer (int64), intent(in) :: ndim
    complex (real64), dimension(ndim,ndim), intent(in) :: matrix
    complex (real64), dimension(ndim), intent(out)   :: diagonalelements
    complex (real64), dimension(ndim), intent(out)   :: upperelements
    complex (real64), dimension(ndim), intent(out)   :: lowerelements

    forall(i=1:ndim) diagonalelements(i)= matrix(i,i)
    forall(i=1:ndim-1)  upperelements(i)=matrix(i+1,i)
    forall(i=2:ndim)  lowerelements(i)=matrix(i-1,i)
  end subroutine matrixsplit

  !Thomas Algorithmus
  subroutine TDMA(diagonalelements,upperelements,lowerelements,x,d,ndim)
    use iso_fortran_env
    implicit none
    integer (int64) :: i
    integer (int64), intent(in) :: ndim
    complex (real64), dimension(ndim), intent(in) :: diagonalelements, d
    complex (real64), dimension(ndim), intent(in) :: upperelements, lowerelements
    complex (real64), dimension(ndim), intent(out) :: x
    complex (real64), dimension(ndim) :: bhilf, dhilf
    complex (real64) :: m

    bhilf = diagonalelements
    dhilf = d

    do i = 2, ndim, 1
       m=lowerelements(i)/bhilf(i-1)
       bhilf(i) = bhilf(i) - m*upperelements(i-1)
       dhilf(i) = dhilf(i) - m*dhilf(i-1)
    end do

    x(ndim) = dhilf(ndim)/bhilf(ndim)

    do i = ndim-1, 1, -1
       x(i)=(dhilf(i)-upperelements(i)*x(i+1))/bhilf(i)
    end do

  end subroutine TDMA

end module funktionen
