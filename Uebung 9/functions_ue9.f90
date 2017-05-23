module functions_ue9
  use iso_fortran_env, only : real64, int64
  use parameter_ue9, only: ising_lattice, size_of_lattice
  use parameter_ue9, only: number_of_neighbours, neighbours_i, neighbours_j
  use parameter_ue9, only: beta, magnetization_sum, magnetization_sum_squared
  use parameter_ue9, only: beta, magnetization_sum_biquadratic
  use parameter_ue9, only: coupling_constant
  implicit none

  private
  public :: initialize_ising_lattice, sweep

contains


  subroutine initialize_ising_lattice(ising_lattice,size_of_lattice)
    integer (int64), intent(in) :: size_of_lattice
    integer (int64), dimension(size_of_lattice,size_of_lattice), intent(inout) :: ising_lattice

    integer (int64) :: i,j

    real (real64) :: r


    do i = 1, size_of_lattice, 1
       do j = 1, size_of_lattice, 1
          call random_number(r)
          if ( r > 0.5_real64 ) then
             ising_lattice(i,j) = 1
          else
             ising_lattice(i,j) = -1
          end if
       end do
    end do


  end subroutine initialize_ising_lattice

  pure real (real64) function calculate_energy(ising_lattice, size_of_lattice, &
       & coupling_constant, H_field)
    integer (int64), intent(in) :: size_of_lattice
    integer (int64), dimension(size_of_lattice,size_of_lattice), intent(in) :: ising_lattice

    real (real64), intent(in) :: coupling_constant, H_field

    integer (int64) :: i,j,k, l, m

    real (real64) :: energy

    energy = 0._real64

    do i = 1, size_of_lattice, 1
       do j = 1, size_of_lattice, 1
          do k=1, number_of_neighbours, 1
             l = i + neighbours_i(k)
             m = j + neighbours_j(k)


             if (l <= 0) then
                l = size_of_lattice
             else
                if(l > size_of_lattice) then
                   l = 1
                endif
             endif
             if (m <= 0) then
                m = size_of_lattice
             else
                if(m > size_of_lattice) then
                   m = 1
                endif
             endif

             !  select case (m)
             !  case (:1)
             !     m = size_of_lattice
             !  case (size_of_lattice:)
             !     m = 1
             !  end select

             energy = energy - coupling_constant*ising_lattice(i,j)*ising_lattice(l,m)
          end do
          energy = energy - H_field*ising_lattice(i,j)*2._real64

       end do
    end do

    calculate_energy = energy*0.5_real64

  end function calculate_energy

  subroutine sweep(ising_lattice, size_of_lattice, no_of_sweeps, energy,magnetization, warmup_bool)
    integer :: i, j, k
    integer (int64), intent(in) :: size_of_lattice, no_of_sweeps
    integer (int64), dimension(size_of_lattice,size_of_lattice), intent(inout) :: ising_lattice
    real (real64), intent(inout) :: energy, magnetization
    logical, intent(in) :: warmup_bool

    real (real64) :: random,r, randomx, randomy, energy_difference

    integer (int64) :: random_lattice_point_x, random_lattice_point_y

    do i = 1, no_of_sweeps, 1
       do j = 1, size_of_lattice**2, 1

          call random_number(randomx)
          call random_number(randomy)

          random_lattice_point_x = nint(randomx*size_of_lattice + 1)
          random_lattice_point_y = nint(randomy*size_of_lattice + 1)

          energy_difference = calculate_energy_difference(ising_lattice,&
               &size_of_lattice, &
               &random_lattice_point_x,random_lattice_point_y)

          call random_number(random)

          r = min(1._real64, exp(energy_difference*beta))

          if (random < r ) then
             ising_lattice(random_lattice_point_x,random_lattice_point_y) = &
                  &-ising_lattice(random_lattice_point_x,random_lattice_point_y)
             energy = energy + energy_difference
             if ( warmup_bool ) then
                magnetization = magnetization - 2*ising_lattice(random_lattice_point_x,random_lattice_point_y)
             end if
          end if
       end do
       if ( warmup_bool ) then
          magnetization_sum = magnetization_sum + abs(magnetization)
          magnetization_sum_squared = magnetization_sum_squared + magnetization**2
          magnetization_sum_biquadratic = magnetization_sum_biquadratic + &
               & magnetization**4

       end if
    end do
  end subroutine sweep


  pure real (real64) function calculate_energy_difference(ising_lattice,&
       &size_of_lattice, &
       &x,y)

    integer (int64), intent(in) :: size_of_lattice, x, y
    integer (int64), dimension(size_of_lattice,size_of_lattice), intent(in) :: ising_lattice

    integer (int64) :: i,j,k, left, right, down, up

    real (real64) :: deltaenergy

    deltaenergy = 0._real64

    if (x - 1 <= 0) then
       left = size_of_lattice
    else
       left=x - 1
    end if

    if (x+1 > size_of_lattice) then
       right = 1
    else
       right = x + 1
    end if

    if (y-1 <= 0) then
       down = size_of_lattice
    else
       down = y - 1
    end if

    if (y + 1 > size_of_lattice) then
       up = 1
    else
       up = y + 1
    endif


    calculate_energy_difference =  coupling_constant*(-ising_lattice(x,y))*2._real64 *&
         &(ising_lattice(right,y)+ising_lattice(right,up)+ising_lattice(x,down)&
         &+ising_lattice(left,y)+ising_lattice(left,up)+ising_lattice(x,up))


  end function calculate_energy_difference


end module functions_ue9
