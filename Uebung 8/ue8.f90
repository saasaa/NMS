program ue8
  use iso_fortran_env, only :  real64, real32, int64, output_unit
  use parameter
  use functions_ue9

  implicit none

  integer (int64) ::  i,j, ios
  integer (int64), parameter :: l=2
  real (real64), dimension(0:Nrmax) :: wave_function
  real (real64), dimension(NEmax) :: delta

  real (real64) :: energy, bessel1, bessel2, neu1, neu2



  do i = 1, NEmax, 1
     energy = i*energy_step

     wave_function = numerov(energy=energy, l=l, direction_forward=.true.)

     call bessel(Sqrt(mhb2*energy)*(Nrmax-1)*stepsize_r,l,bessel1,neu1)
     call bessel(Sqrt(mhb2*energy)*(Nrmax)*stepsize_r,l,bessel2,neu2)

     delta(i) = &
          & atan((wave_function(Nrmax-1)*bessel2-wave_function(Nrmax)*bessel1)&
          &/(wave_function(Nrmax-1)*neu2-wave_function(Nrmax)*neu1)*(-1))
     !woher -1?

  end do


  open(unit=31, file="delta.dat", status="replace")

  do i = 1, NEmax, 1


     !  If(delta(i+1)-delta(i)<0 .and. Abs(delta(i+1)-delta(i))>0.95*PI) then
     !     do j=i,NEmax
     !        delta(j+1)=delta(j+1)+PI
     !     end do
     !  end if
     !
     !  If(delta(i+1)-delta(i)>0 .and. Abs(delta(i+1)-delta(i))>0.28) then
     !     write(*,*) i
     !     do j=i,NEmax
     !        delta(j+1)=delta(j+1)-PI
     !     end do
     !  end if

     write(31,*) energy_step*i, delta(i)

  end do


  close(unit=31, status="keep")






end program ue8
