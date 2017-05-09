module functions
  use iso_fortran_env, only : real32, int64
  implicit none

  private
  public :: process_file, return_power, write_ft_to_file

contains

  subroutine process_file(filename, number_of_lines, data)
    integer (int64) :: i, ioerr
    character(len=*), intent(in) :: filename
    integer (int64), intent(out) :: number_of_lines
    real (real32), dimension(:), allocatable, intent(out) :: data

    ioerr=0

    number_of_lines = count_lines(filename)

    allocate (data(number_of_lines))

    open(unit=20, file=filename, iostat=ioerr, status="old", action="read")
    if ( ioerr /= 0 ) stop "Error opening file; subroutine: open_file"

    do i=1,number_of_lines
       read(unit=20, fmt=*, iostat=ioerr) data(i)
       if ( ioerr /= 0 ) stop "Read error in file unit 20; subroutine: open_file"
    end do

    close(unit=20, iostat=ioerr, status="keep")
    if ( ioerr /= 0 ) stop "Error closing file unit 20; subroutine: open_file"

  end subroutine process_file



  integer (int64) function count_lines(filename)
    character(len=*), intent(in) :: filename
    integer (int64)              :: number_of_lines
    integer (int64)              :: ioerr
    ioerr = 0

    open(unit=20, file=filename, iostat=ioerr, status="old", action="read")
    if ( ioerr /= 0 ) stop "Error opening file; function: count_lines"

    number_of_lines = 0

    do
       read(unit=20, fmt="(I10)", iostat=ioerr)
       if (ioerr /= 0) exit
       number_of_lines = number_of_lines + 1
    end do

    close(unit=20, iostat=ioerr, status="keep")
    if ( ioerr /= 0 ) stop "Error closing file unit 20; function: count_lines"

    count_lines = number_of_lines

  end function count_lines


  subroutine write_ft_to_file(filename,ft_data,n_dim)
    integer (int64) :: i
    character(len=*), intent(in) :: filename
    integer (int64), intent(in) :: n_dim
    real (real32), dimension(n_dim), intent(in) :: ft_data
    real (real32), parameter :: samplerate = 22050._real32

    open(21, file=filename, status='replace')
    do i=1, n_dim/2, 1
       write(21, *) real(i)*samplerate/real(n_dim), ft_data(i)**2 + ft_data(i+n_dim/2)**2
    end do

    close (21, status='keep')

  end subroutine write_ft_to_file


  !return power of 2
  pure integer (int64) function return_power(arg)
    integer (int64), intent(in) :: arg

    !POPCNT(I) returns the number of bits set (’1’ bits) in the binary representation of I.

    if(arg <= 0 .or. popcnt(arg) > 1) then
       return_power = -1
       return
    end if
    !TRAILZ returns the number of trailing zero bits of an integer. Fortran 2008 and later

    return_power = trailz(arg)

  end function return_power

end module functions
