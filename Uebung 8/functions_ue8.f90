module functions_ue8
  use iso_fortran_env, only : real64, int64
  use parameter
  implicit none

  !  private
  ! public :: runge_kutta, trapezint, return_power

contains

  pure real (real64) function Vpot(x)
    real (real64), intent(in) :: x

    Vpot=-V0/(1._real64+exp((x-R0)/a0)) + V1*exp(-(x-R1)**2/a1)

  end function Vpot

  pure real (real64) function w(x,l,energy)
    real (real64), intent(in) :: x, energy
    integer (int64), intent(in) :: l

    w = mhb2*energy-mhb2*Vpot(x) &
         &-l*(l+1)/(x**2)

  end function w

  pure function numerov(energy, l, direction_forward)
    integer (int64) :: i
    logical, optional, intent(in) :: direction_forward
    integer (int64), intent(in) ::  l
    real (real64), dimension(0:Nrmax) :: numerov
    real (real64), intent(in) :: energy

    real (real64), dimension(0:Nrmax) :: u
    real (real64) :: q_plus_one, q, q_minus_one



    if (present(direction_forward) .and. direction_forward == .true. .or. (.not. present(direction_forward)) ) then

       u(0) = 0._real64
       u(1) = 0.01_real64

       q_minus_one = 0._real64
       q = (1._real64+&
            &stepsize_r*stepsize_r*&
            &w(stepsize_r*1._real64,l,&
            &energy)/12._real64)*u(1)

       do i = 2, Nrmax, 1
          q_plus_one = 12._real64 * u(i-1) - 10._real64*q - q_minus_one
          u(i) = q_plus_one/(1._real64+&
               &stepsize_r*stepsize_r*w(stepsize_r*i,l,&
               &energy)/12._real64)

          q_minus_one = q
          q = q_plus_one

       end do

    else if (present(direction_forward) .and. direction_forward == .false. ) then
       u(Nrmax) = 0._real64
       u(Nrmax-1) = 0.01_real64

       q_plus_one = 0._real64
       q = (1._real64+&
            &stepsize_r*stepsize_r*&
            &w(stepsize_r*Nrmax,l,&
            &energy)/12._real64)*u(Nrmax-1)

       do i = Nrmax-2, 0, -1
          q_minus_one = 12._real64 * u(i+1) - 10._real64*q - q_plus_one
          u(i) = q_minus_one/(1._real64+&
               &stepsize_r*stepsize_r*w(stepsize_r*i,l,&
               &energy)/12._real64)

          q_plus_one = q
          q = q_minus_one

       end do

    end if

    numerov = u

  end function numerov


  pure subroutine bessel(x,l,bes,neu)
    !
    ! evaluates the Bessel and Neumann functions in
    ! Riccati form for given l at the argument x
    !   j0=sin(x),n0=cos(x)
    !   j1=sin(x)/x-cos(x)
    !   n1=cos(x)/x+sin(x)
    !   j2=sin(x)*(3/x**2-1)-3*cos(x)/x
    !   n2=cos(x)*(3/x**2-1)+3*sin(x)/x
    !
    !
    integer (int64), intent(in) :: l
    real (real64), intent(in) :: x
    real (real64), intent(out) :: bes,neu
    !
    bes=0._real64
    neu=0._real64
    if(l.eq.0) then
       bes=sin(x)
       neu=cos(x)
    end if
    !
    if(l.eq.1) then
       bes=sin(x)/x-cos(x)
       neu=cos(x)/x+sin(x)
    end if
    !
    if(l.eq.2) then
       bes=sin(x)*(3/x**2-1._real64)-3._real64*cos(x)/x
       neu=cos(x)*(3/x**2-1._real64)+3._real64*sin(x)/x
    end if

    return
  end subroutine bessel


end module functions_ue8
