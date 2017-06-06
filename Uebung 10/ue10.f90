program ue10
  use iso_fortran_env, only : real64, int64, output_unit, input_unit
  use parameter_ue10
  use functions_ue10
  implicit none

  integer (int64) :: i,j,q

  !call init_random_seed()
  q=0
  overall_error = 0._real64
  correct_pixels = 0_int64
  ios=0
  sweeps = 20
  temperature = 200
  call initialize_SA_lattice(SA_image, Nimax, Njmax)

  call read_image(filename = "SimMRimage.dat", &
       &MR_image = MR_image, &
       &size_of_lattice_i = Nimax, size_of_lattice_j = Njmax)

  call read_image(filename = "CorrectSegImage.dat", &
       &MR_image = Correct_image, &
       &size_of_lattice_i = Nimax, size_of_lattice_j = Njmax)



  do while(temperature > temperature_final)
     beta = 1._real64/temperature
     do i=1, sweeps
        do j = 1, Nimax*Njmax, 1

           call random_number(randomx)
           call random_number(randomy)

           random_lattice_point_x = int(randomx*Nimax) + 1
           random_lattice_point_y = int(randomy*Njmax) + 1

           brain_tissue_old = SA_image(random_lattice_point_x,random_lattice_point_y)

           call random_number(random)

           brain_tissue_new = int(random*5._real64) + 1

           if ( brain_tissue_new == brain_tissue_old ) then
              brain_tissue_new = mod(brain_tissue_new + 1, 5) + 1
           end if

           energy_difference = calculate_energy_difference(SA_image,MR_image,&
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


  call output_image_matrix(filename = "SegSAmatrix.dat", &
       &SA_image = SA_image, &
       &size_of_lattice_i = Nimax, size_of_lattice_j = Njmax)

  do i=1, sweeps
     do j = 1, Nimax*Njmax, 1

     end do
  end do

  call calculate_pixels(Correct_image, correct_pixels, Nimax, Njmax)

  call calculate_pixels(SA_image, sim_pixels, Nimax, Njmax)

  write(*,*) "Fehler"

  do i = 1, 5, 1
     rel_pixels_error(i) = abs(correct_pixels(i) - sim_pixels(i))/real(correct_pixels(i),real64)
  end do


  do i = 1, 5, 1
     write(*,*) rel_pixels_error(i) * 100
     overall_error = overall_error + rel_pixels_error(i) * 100
  end do

  write(*,*) "gesamter Fehler",  overall_error

end program ue10
