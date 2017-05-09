PROGRAM ue6
  use iso_fortran_env, only : real32, int32, int64
  use functions, only :  process_file, return_power, write_ft_to_file

  implicit none

  integer (int64) ::  ioerr
  integer (int64) :: sin_number_of_lines, noise_number_of_lines
  integer (int64) :: rampe3k_number_of_lines, rampe10k_number_of_lines

  real (real32), dimension(:), allocatable :: sin_data, noise_data
  real (real32), dimension(:), allocatable :: rampe3k_data, rampe10k_data
  real (real32), dimension(:), allocatable :: sin_ft_data, noise_ft_data
  real (real32), dimension(:), allocatable :: rampe3k_ft_data, rampe10k_ft_data

  ioerr = 0

  call process_file(filename = "sin2000.dat",&
       &number_of_lines = sin_number_of_lines,&
       &data = sin_data)

  call process_file(filename = "noise.dat",&
       &number_of_lines = noise_number_of_lines,&
       &data = noise_data)

  call process_file(filename = "rampe-3000.dat",&
       &number_of_lines = rampe3k_number_of_lines,&
       &data = rampe3k_data)

  call process_file(filename = "rampe-100-10k.dat",&
       &number_of_lines = rampe10k_number_of_lines,&
       &data = rampe10k_data)

  allocate (sin_ft_data(sin_number_of_lines))
  allocate (noise_ft_data(noise_number_of_lines))
  allocate (rampe3k_ft_data(rampe3k_number_of_lines))
  allocate (rampe10k_ft_data(rampe10k_number_of_lines))



  call RPA(return_power(sin_number_of_lines),sin_data,1,sin_ft_data,1)
  call RPA(return_power(noise_number_of_lines),noise_data,1,noise_ft_data,1)
  call RPA(return_power(rampe3k_number_of_lines),   rampe3k_data,1,rampe3k_ft_data,1)
  call RPA(return_power(rampe10k_number_of_lines), rampe10k_data,1,rampe10k_ft_data,1)



  call write_ft_to_file("ft_sin.dat", sin_ft_data, sin_number_of_lines)
  call write_ft_to_file("ft_rampe3k.dat", rampe3k_ft_data, rampe3k_number_of_lines)
  call write_ft_to_file("ft_noise.dat", noise_ft_data, noise_number_of_lines)
  call write_ft_to_file("ft_rampe10k.dat", rampe10k_ft_data, rampe10k_number_of_lines)



  deallocate (sin_data)
  deallocate (sin_ft_data)
  deallocate (noise_data)
  deallocate (noise_ft_data)
  deallocate (rampe3k_data)
  deallocate (rampe3k_ft_data)
  deallocate (rampe10k_data)
  deallocate (rampe10k_ft_data)

end PROGRAM ue6
