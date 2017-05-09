module template
  use iso_fortran_env, only : real32, int64
  implicit none

  private
  public :: test, templ

contains

  pure integer (int64) function templ(n)

    integer (int64), intent(in) :: n
    templ=n*n
  end function templ

  subroutine test(n)
    integer (int64), intent(inout) :: n
    n=n+1

    write(*,*) "hello module"

  end subroutine test

end module template
