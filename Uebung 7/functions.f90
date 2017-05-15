module functions
  use iso_fortran_env, only : real64, int64
  use pendulum_parameter, only : eta,natural_frequency_squared, reduced_force, driver_frequency, stepsize_time
  implicit none

  private
  public :: runge_kutta, trapezint

contains

  pure function runge_kutta(y_vector, stepsize_h, timestep)

    integer (int64), intent(in) :: timestep
    real (real64), intent(in) :: stepsize_h
    real (real64), dimension(0:2) :: runge_kutta
    real (real64), dimension(0:2), intent(in) :: y_vector

    real (real64), dimension(0:2) :: z, k1, k2, k3, k4

    z = y_vector

    k1 = assign_k(z,timestep)

    z = y_vector + k1*stepsize_time*0.5_real64

    k2 = assign_k(z,timestep)

    z = y_vector + k2*stepsize_time*0.5_real64

    k3 = assign_k(z, timestep)

    z = y_vector + k3*stepsize_time

    k4 = assign_k(z,timestep)

    runge_kutta = y_vector + stepsize_time*(k1+2*k2+2*k3+k4)/6._real64

  end function runge_kutta

  pure function assign_k(z,timestep)

    integer (int64), intent(in) :: timestep
    real (real64), dimension(0:2), intent(in) :: z
    real (real64), dimension(0:2) :: assign_k
    real (real64), dimension(0:2) :: k


    assign_k = [1._real64, z(2),&
         & -2._real64*eta*z(2) - &
         & natural_frequency_squared*sin(z(1)) + &
         & reduced_force*sin(timestep*stepsize_time*driver_frequency)]

  end function assign_k


  pure real (real64) function trapezint(array,ndim,startintervall,endintervall,ersterindex,letzterindex) result(res)
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
