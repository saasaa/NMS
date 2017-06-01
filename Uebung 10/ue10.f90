program ue10
  use iso_fortran_env, only : real64, int64, output_unit, input_unit
  use parameter_ue10
  use functions_ue10
  implicit none

  integer (int64) :: i,j,q

  call init_random_seed()
  q=0
  ios=0
  sweeps = 500!1024_int64
  temperature = 1000
  call initialize_SA_lattice(SA_image, Nimax, Njmax)

  call read_image(filename = "SimMRimage.dat", &
       &MR_image = MR_image, &
       &size_of_lattice_i = Nimax, size_of_lattice_j = Njmax)

  !do k=1, 10
  do while( temperature > temperature_final )
     beta = 1._real64/temperature
     do i=1, sweeps
        do j = 1, Nimax*Njmax, 1

           call random_number(randomx)
           call random_number(randomy)

           random_lattice_point_x = int(randomx*Nimax) + 1
           random_lattice_point_y = int(randomy*Njmax) + 1

           brain_tissue_old = SA_image(random_lattice_point_x,random_lattice_point_y)

           call random_number(random)

           brain_tissue_new = int(random*5._real64)+1

           energy_difference = calculate_energy_difference(SA_image, MR_image,&
                &Nimax, Njmax, &
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
     temperature = temperature/lambda
     q=q+1
     write(*,*) temperature
  end do

  write(*,*) q

  !  write(*,*) calculate_energy_difference(SA_image,&
  ! &Nimax, Njmax, &
  !&i,i, 2_int64, 1_int64)


  !call output_image(filename = "SegSA.dat", &
  !   &SA_image = SA_image, &
  !  &size_of_lattice_i = Nimax, size_of_lattice_j = Njmax)

  call output_image_matrix(filename = "SegSAmatrix.dat", &
       &SA_image = SA_image, &
       &size_of_lattice_i = Nimax, size_of_lattice_j = Njmax)

  write(*,*) 1d3, 5d-2, 11d-1, 3d0

end program ue10
