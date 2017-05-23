
Program Ising

  external CalcE

  integer NMax,NN                  !/* Maximal lattice size, # neighbors*/
  real*8 JJ, HH                      !/* Coupling constant, magnetic field */
  parameter (NMax=50,NN=4)
  parameter (JJ=1.d0,HH=0.d0)


  integer mag(Nmax,Nmax)            !/* 2D Ising Lattice */
  integer i, j, k                   !/* Loop counters */
  integer s,d                       !/* Lattice spin variables */  
  real*8 Energy                     !/* Total lattice energy */
  integer Inn(NN)                    !/*  Nearest neighbor array I  */
  parameter (Inn=(/1,-1,0,0/))
  integer Jnn(NN)                       !/*  Nearest neighbor array J  */
  parameter (Jnn=(/0,0,1,-1/)) 
  integer Inew, Jnew                !/* Nearest neighbot indices */ 
  real*8 Etemp, deltaE              !/* Temp energy variables for MC moves */ 
  integer accept                    !/* Number of accepted moves */   
  integer move                      !/* Number of moves total */   

  real*8 T                          !/* temperature (in units of J/k_B) */
  real*8 beta
  integer sweeps                    !/* number of measurement sweeps */
  integer warm                      !/* number of warm-up sweeps */
  integer L                             !/* lattice dimension */


 ! /***************************
 !  * Initialization          *
 !  ***************************/

  write (*,*) "Temperatur ?"
  read(*,*) T
  beta=1.d0/T

  write (*,*) "Gittergroesse (L x L) ?"
  read(*,*) L

  write (*,*) "# sweeps ?"
  read(*,*) sweeps
  
  write (*,*) "# warm up sweeps?"
  read(*,*) warm

  call random_init(mag,L,Nmax)  
  Energy = CalcE(mag,L,Jnn,Inn,NN,JJ,HH,Nmax)

 
! /***************************
! /* warum up sweeps */
! /***************************
 
 
 
! /***************************
! /* end warum up sweeps */ 
! /***************************
 
  



 

! /***************************
! /*  sweeps */
! /***************************



! /***************************
! /*  end sweeps */ 
! /***************************

  call  outputmag(mag,L,Nmax)
  write (*,*) 'Average energy',Energy
end Program Ising







subroutine random_init(mag,L,Nmax)
  integer Nmax
  integer mag(Nmax,Nmax), L
 
  integer i,j
  
  do i=1,L
     do j=1,L
       	if (rand().gt.0.5d0) then
	   mag(i,j) = 1
        else
           mag(i,j) = -1
        endif
     enddo
  enddo

  return
end subroutine random_init



subroutine outputmag(mag,L,Nmax)
  integer Nmax
  integer mag(Nmax,Nmax), L
 
  integer i,j
  write (*,*) 'Spin snapshot'

  do i=1,L
     do j=1,L
        if(mag(i,j).eq. 1) then
	   write(*,'(a)',ADVANCE='NO') '-> '
        else
           write(*,'(a)',ADVANCE='NO') '<- '
        endif
      
     enddo
     !     Newline to complete
     write (*,*) 
     write (*,*)
  enddo
  return 
end subroutine outputmag




real function CalcE(mag,L,Jnn,Inn,NN,JJ,HH,Nmax)
  integer Nmax
  integer mag(Nmax,Nmax),Jnn(NN),Inn(NN),L,NN
  
  real*8 JJ, HH
  integer i,j,k,Inew,Jnew
  real*8 Energy

  !/* Determine the initial energy */
  Energy = 0.0
  
  do i=1,L
     do j=1,L
        
	!/* Loop over nearest neighbors */
	do k=1, NN  
            Inew = i + Inn(k)       
            Jnew = j + Jnn(k)
    
	    !/* Check periodic boundary conditions */
	    if (Inew .le. 0) then
	      Inew = L
            else 
               if(Inew .gt. L) then 
                  Inew = 1
               endif
            endif    
            if (Jnew .le. 0) then
	      Jnew = L
            else 
               if(Jnew .gt. L) then 
                  Jnew = 1
               endif
            endif
	    
	    !/* Update the energy */
	    Energy = Energy-JJ * mag(i,j) * mag(Inew,Jnew)
        enddo
	!/*Calculate the contribution from the field H */
	Energy = Energy - 2.d0*HH*mag(i,j);
     enddo
   enddo

   !/* Account for double counting */
   Energy = Energy/2.d0;

   CalcE=Energy
   return
 end function CalcE
