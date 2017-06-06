module functions_ue10
  use iso_fortran_env, only : real64, int64
  use parameter_ue10
  implicit none

  !private
  !public :: initialize_ising_lattice, sweep

contains




  subroutine read_image(filename, MR_image, size_of_lattice_i, size_of_lattice_j)

    integer (int64) :: i,j, ios
    integer (int64), intent(in) :: size_of_lattice_i, size_of_lattice_j
    integer (int64), intent(out) :: MR_image(size_of_lattice_i, size_of_lattice_j)
    character(len=*), intent(in) :: filename
    integer (int64) :: dummyi, dummyj

    ios=0

    open(unit=21, file=filename, iostat=ios, form="formatted", action="read")
    if ( ios /= 0 ) stop "Error opening file "

    do i=1,size_of_lattice_i
       do j=1, size_of_lattice_j
          read(21,'(3I5)') dummyi,dummyj, MR_image(i,j)
       enddo
       read (21,*)
    enddo

    close(unit=21, iostat=ios, status="keep")
    if ( ios /= 0 ) stop "Error closing file unit 21"

  end subroutine read_image


  subroutine output_image(filename, SA_image, size_of_lattice_i, size_of_lattice_j)
    integer (int64), intent(in) :: size_of_lattice_i, size_of_lattice_j
    integer (int64), intent(in) :: SA_image(size_of_lattice_i, size_of_lattice_j)
    integer (int64) :: i,j, ios
    character(len=*), intent(in) :: filename

    open(unit=31, file=filename, iostat=ios, status="replace", action="write", form="formatted")
    if ( ios /= 0 ) stop "Error opening file "

    do i = 1, size_of_lattice_i, 1
       do j = 1, size_of_lattice_j, 1
          write(31,'(3I5)') i, j, SA_image(i,j)
       enddo
       write (31,*)
    end do

    close(unit=31, iostat=ios, status="keep")
    if ( ios /= 0 ) stop "Error closing file unit 31"

  end subroutine output_image

  subroutine output_image_matrix(filename, SA_image, size_of_lattice_i, size_of_lattice_j)
    integer (int64), intent(in) :: size_of_lattice_i, size_of_lattice_j
    integer (int64), intent(in) :: SA_image(size_of_lattice_i, size_of_lattice_j)
    integer (int64) :: i,j, ios
    character(len=*), intent(in) :: filename

    open(unit=31, file=filename, iostat=ios, status="replace", action="write", form="formatted")
    if ( ios /= 0 ) stop "Error opening file "


    do j = 1, size_of_lattice_j, 1
       write(31,'(254(I5))')  (SA_image(i,j), i = 1, size_of_lattice_i)
    end do

    close(unit=31, iostat=ios, status="keep")
    if ( ios /= 0 ) stop "Error closing file unit 31"

  end subroutine output_image_matrix


  subroutine initialize_SA_lattice(SA_lattice,size_of_lattice_i, size_of_lattice_j)
    integer (int64), intent(in) :: size_of_lattice_i, size_of_lattice_j
    integer (int64), dimension(size_of_lattice_i, size_of_lattice_j), intent(inout) :: SA_lattice
    integer (int64) :: i,j
    real (real64) :: r

    do j = 1, size_of_lattice_j, 1
       do i = 1, size_of_lattice_i, 1
          call random_number(r)
          SA_lattice(i,j) = int(r*5._real64) + 1_int64
       end do
    end do

  end subroutine initialize_SA_lattice

  pure real (real64) function calculate_energy_difference(SA_lattice,&
       &MR_lattice, size_of_lattice_i, size_of_lattice_j, &
       &x,y, brain_new, brain_old)
    integer (int64), intent(in) :: size_of_lattice_i, size_of_lattice_j
    integer (int64), intent(in) :: x, y, brain_new, brain_old
    integer (int64), dimension(size_of_lattice_i,size_of_lattice_j), intent(in) :: SA_lattice, MR_lattice

    integer (int64) :: left, right, down, up
    integer (int64) :: deltasum_old, deltasum_new
    real (real64) :: delta_energy_old, delta_energy_new

    deltasum_old = 0_int64
    deltasum_new = 0_int64

    if (x - 1 <= 0) then
       left = size_of_lattice_i
    else
       left = x - 1
    end if

    if (x + 1 > size_of_lattice_i) then
       right = 1
    else
       right = x + 1
    end if

    if (y - 1 <= 0) then
       down = size_of_lattice_j
    else
       down = y - 1
    end if

    if (y + 1 > size_of_lattice_j) then
       up = 1
    else
       up = y + 1
    endif

    deltasum_old = kronecker_delta(SA_lattice(x,up), brain_old) + &
         &kronecker_delta(SA_lattice(x,down), brain_old) + &
         &kronecker_delta(SA_lattice(left,y), brain_old) + &
         &kronecker_delta(SA_lattice(right,y), brain_old)

    deltasum_new = kronecker_delta(SA_lattice(x,up), brain_new) + &
         &kronecker_delta(SA_lattice(x,down), brain_new) + &
         &kronecker_delta(SA_lattice(left,y), brain_new) + &
         &kronecker_delta(SA_lattice(right,y), brain_new)

    delta_energy_old = -coupling_constant*deltasum_old + &
         & ((MR_lattice(x,y) - mean_values(brain_old))**2._real64)/&
         & (2._real64*sigma(brain_old)**2._real64) + &
         & log(real(sigma(brain_old),real64))

    delta_energy_new = -coupling_constant*deltasum_new + &
         & ((MR_lattice(x,y) - mean_values(brain_new))**2._real64)/&
         & (2._real64*sigma(brain_new)**2._real64) + &
         & log(real(sigma(brain_new),real64))


    calculate_energy_difference =  delta_energy_new - delta_energy_old

  end function calculate_energy_difference


  pure subroutine calculate_pixels(lattice, pixel_array, size_of_lattice_i,  size_of_lattice_j)

    integer (int64), intent(in) :: size_of_lattice_i,  size_of_lattice_j
    integer (int64), dimension(size_of_lattice_i, size_of_lattice_j), intent(in) :: lattice

    integer (int64),  dimension(5), intent(out) :: pixel_array

    integer (int64) :: i,j

    do i=1, size_of_lattice_i
       do j=1, size_of_lattice_j
          if (lattice(i,j) == 1) then
             pixel_array(1) = pixel_array(1) + 1
          else if(lattice(i,j) == 2) then
             pixel_array(2) = pixel_array(2) + 1
          else if(lattice(i,j) == 3) then
             pixel_array(3) = pixel_array(3) + 1
          else if(lattice(i,j) == 4) then
             pixel_array(4) = pixel_array(4) + 1
          else if(lattice(i,j) == 5) then
             pixel_array(5) = pixel_array(5) + 1
          end if
       enddo
    enddo


  end subroutine calculate_pixels




  pure integer (int64) function kronecker_delta(i,j)
    integer (int64), intent(in) :: i, j
    if (i == j) then
       kronecker_delta = 1_int64
       return
    else
       kronecker_delta = 0_int64
       return
    end if
  end function kronecker_delta


  subroutine init_random_seed()
    integer :: i, n, clock
    integer, dimension(:), allocatable :: seed

    call random_seed(size = n)
    allocate(seed(n))

    call system_clock(count=clock)

    seed = clock + 37 * (/ (i - 1, i = 1, n) /)
    call random_seed(put = seed)

    deallocate(seed)
  end subroutine init_random_seed



  ! not working!
  subroutine sweep(SA_lattice, MR_lattice, size_of_lattice_i, size_of_lattice_j, no_of_sweeps, beta)
    integer (int64) :: i, j
    integer (int64), intent(in) :: size_of_lattice_i, size_of_lattice_j
    integer (int64), intent(in) :: no_of_sweeps
    integer (int64), dimension(size_of_lattice_i, size_of_lattice_j), intent(inout) :: SA_lattice
    integer (int64), dimension(size_of_lattice_i,size_of_lattice_j), intent(in) :: MR_lattice

    real (real64), intent(in) :: beta


    real (real64) :: random, r, randomx, randomy
    real (real64) :: energy_difference

    integer (int64) :: random_lattice_point_x, random_lattice_point_y
    integer (int64) :: brain_tissue_old, brain_tissue_new
    do i = 1, no_of_sweeps, 1
       do j = 1, size_of_lattice_i*size_of_lattice_j, 1

          call random_number(randomx)
          call random_number(randomy)

          random_lattice_point_x = int(randomx*size_of_lattice_i) + 1
          random_lattice_point_y = int(randomx*size_of_lattice_j) + 1

          call random_number(random)

          brain_tissue_new = int(random*5._real64)+1

          energy_difference = calculate_energy_difference(SA_image, MR_image,&
               &size_of_lattice_i, size_of_lattice_j, &
               &random_lattice_point_x, random_lattice_point_y,&
               &brain_tissue_new, brain_tissue_old)

          if (energy_difference*beta > 20._real64)  then
             r=0._real64
          else
             if (energy_difference*beta  < 0.05_real64)  then
                r=1._real64
             else
                r=exp(-energy_difference*beta)
             end if
          end if

          r = min(1._real64, r)

          call random_number(random)

          if (random < r ) then
             SA_image(random_lattice_point_x,random_lattice_point_y) = &
                  & brain_tissue_new
          end if

       end do
    end do
  end subroutine sweep



end module functions_ue10
