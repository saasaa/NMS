program ue8
  use iso_fortran_env, only :  real64, real32, int64, output_unit
  use parameter
  use functions_ue8

  implicit none

  integer (int64) ::  i,j, ios
  integer (int64), parameter :: l=2
  real (real64), dimension(0:Nrmax) :: wave_function
  real (real64), dimension(NEmax) :: delta, time_delay

  real (real64) :: energy, bessel1, bessel2, neu1, neu2



  !do i = 1, NEmax, 1
  energy =energy_max - (i-1)*energy_step
  !energy=Emax-(i-1)*dE

  energy = 80._real64

  wave_function = numerov(energy=energy, l=l, direction_forward=.false.)

  !do i = 1, Nrmax, 1
  !write(*,*) i*stepsize_r, wave_function(i)
  !end do

  write(*,*) wave_function(Nrmax)

  call bessel(Sqrt(mhb2*energy)*(Nrmax-1)*stepsize_r,l,bessel1,neu1)
  call bessel(Sqrt(mhb2*energy)*(Nrmax)*stepsize_r,l,bessel2,neu2)

  delta(i) = &
       & atan((wave_function(Nrmax-1)*bessel2-wave_function(Nrmax)*bessel1)&
       &/(wave_function(Nrmax-1)*neu2-wave_function(Nrmax)*neu1)*(-1))
  !woher -1?

  !end do


  open(unit=31, file="streu_delta_l=2_v1=0.dat", status="replace")

  do i = 1, NEmax, 1

     !
     !
     !  if(delta(i+1)-delta(i)<0 .and. abs(delta(i+1)-delta(i))>0.95*PI) then
     !     do j = i, NEmax
     !        delta(j+1)=delta(j+1) + PI
     !     end do
     !  end if
     !
     !  if(delta(i+1)-delta(i)>0 .and. abs(delta(i+1) - delta(i)) > 0.28) then
     !     do j = i, NEmax
     !        delta(j+1)=delta(j+1) - PI
     !     end do
     !  end if

     write(31,*) energy_max - energy_step*i, delta(i)

  end do
  close(unit=31, status="keep")



  do i=1,NEmax
     S(i)=exp(ci*2*delta(i)-alpha*(energy_max-i*energy_step))
  end do

  open(unit=41, file="argand_l=2_v1=0.dat",  status="replace")

  do i = 1, NEmax, 1
     write(41,*) real(S(i)), real(-ci*S(i))
  end do

  close(unit=41, status="keep")


  do i=1,NEmax-1
     time_delay(i)= hbaratto*(delta(i)-delta(i+1))/(energy_step)
  end do

  !open(unit=51, file="time_delay_v1=18.dat", status="replace")
  !do i=1,NEmax-1
  !     write(51,*) energy_max-i*energy_step, time_delay(i)
  !end do
  !close(unit=51, status="keep")

  !do i = 1, Nrmax, 1
  ! write(*,*) i*stepsize_r, Vpot( i*stepsize_r)
  !end do

end program ue8
