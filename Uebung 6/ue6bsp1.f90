PROGRAM ue6
  use iso_fortran_env

  implicit none

  integer (int64) :: i
  integer (int64), parameter :: samplerate = 22050
  integer (int64), parameter :: n_dim = 2**17
 !   integer (int64), parameter :: n_dim_sinus = 32768
  real (real32), dimension(n_dim) :: sound
  real (real32), dimension(n_dim) ::  ftsound
  
  sound = 0
  ftsound = 0
  
  open (unit=20, file="rampe-3000.dat", form="formatted")

  do i=1,n_dim
     read(20,*) sound(i)
  end do

  close (20, status='keep')

  !write(*,*) sound(2**17)

  call RPA(17,sound,1,ftsound,1)
   
open(21, file='FT.dat', status='replace')

  do i=1, n_dim/2, 1
    write(21,*) i*samplerate/n_dim, ftsound(i)**2 + ftsound(i+n_dim/2)**2
  end do
  
  close (21, status='keep')
  

end PROGRAM ue6
