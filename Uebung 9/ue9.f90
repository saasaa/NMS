!Copyright (c) 2017 

!Permission is hereby granted, free of charge, to any person obtaining a copy
!of this software and associated documentation files (the "Software"), to deal
!in the Software without restriction, including without limitation the rights
!to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
!copies of the Software, and to permit persons to whom the Software is
!furnished to do so, subject to the following conditions:

!The above copyright notice and this permission notice shall be included in all
!copies or substantial portions of the Software.

!THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
!IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
!FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
!AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
!LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
!OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
!SOFTWARE.

program ue9
  use iso_fortran_env, only :  real64, int64, output_unit, input_unit

  use parameter_ue9, only : ising_lattice, size_of_lattice, warmup_sweeps
  use parameter_ue9, only : sweeps, size_of_lattice_squared
  use parameter_ue9, only : size_of_lattice_biquadratic, size_of_lattice_zenzizenzizenzic
  use parameter_ue9, only : magnetization, magnetization_sum, magnetization_sum_squared, magnetization_sum_biquadratic
  use parameter_ue9, only : binder_kumulante
  use parameter_ue9, only : temperature, beta, energy

  use functions_ue9, only : initialize_ising_lattice, sweep

  implicit none

  integer (int64) ::  i,j,q, ios, err


  call random_seed()


  ios=0
  err=0
  !magnetization = 0._real64


  !write(output_unit, *) "input T"
  !read(input_unit, *) temperature
  !temperature = 5._real64
  !beta = 1._real64/temperature


  ! write(output_unit, *) "size of lattice?"
  ! read(input_unit,*) size_of_lattice

  size_of_lattice = 20_int64

  allocate(ising_lattice(size_of_lattice,size_of_lattice), stat=err)
  if (err /= 0) print *, "ising_lattice(size_of_lattice): Allocation request denied"

  !write(output_unit, *) "warm up sweeps?"
  !read(input_unit,*) warmup_sweeps

  warmup_sweeps = 1024

  !write(output_unit, *) "sweeps?"
  !read(input_unit,*) sweeps

  sweeps = 16384

  size_of_lattice_squared = size_of_lattice**2
  size_of_lattice_biquadratic = size_of_lattice**4
  size_of_lattice_zenzizenzizenzic = size_of_lattice**8

  open(unit=21, file="m_msqared20x20.dat", iostat=ios, status="replace")
  if ( ios /= 0 ) stop "Error opening file "
  open(unit=31, file="msqaredbiquardatic_binder_ku20x20.dat", iostat=ios, status="replace")
  if ( ios /= 0 ) stop "Error opening file "


  do q = 1, 100, 1

     magnetization = 0._real64
     temperature = q/10._real64
     beta = 1._real64/temperature
     magnetization_sum = 0._real64
     magnetization_sum_squared = 0._real64
     magnetization_sum_biquadratic = 0._real64
     binder_kumulante = 0._real64

     call initialize_ising_lattice(ising_lattice,size_of_lattice)


     !Warumupsweep
     call sweep(ising_lattice,size_of_lattice,warmup_sweeps,energy,magnetization, .false.)

     !calculate magnetization

     do i = 1, size_of_lattice, 1
        do j = 1, size_of_lattice, 1
           magnetization = magnetization - ising_lattice(i,j)
        end do
     end do

     call sweep(ising_lattice,size_of_lattice,sweeps,energy,magnetization, .true.)

     binder_kumulante = 1._real64 - (magnetization_sum_biquadratic*sweeps/&
          &magnetization_sum_squared**2)/3._real64

     write(21,*) temperature, magnetization_sum/(sweeps*size_of_lattice_squared),&
          &  magnetization_sum_squared/(sweeps*size_of_lattice_biquadratic)

     write (31,*) temperature, magnetization_sum_biquadratic/(sweeps*size_of_lattice_zenzizenzizenzic), binder_kumulante

  end do

  close(unit=21, iostat=ios, status="keep")
  if ( ios /= 0 ) stop "Error closing file unit 21"

  close(unit=31, iostat=ios, status="keep")
  if ( ios /= 0 ) stop "Error closing file unit 21"

  if (allocated(ising_lattice)) deallocate(ising_lattice, stat=err)
  if ( err /= 0) print *, "ising_lattice(size_of_lattice): Deallocation request denied"

  !T_C ca bei 3.6 [J/kb]

end program ue9
