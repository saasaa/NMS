#define PROGNAME "mc_Ising_2D"
#define VERSION "0.2a"
#define DATE  "today"
#define AUTHOR "you"

/* Metropolis Monte Carlo for 2D-Ising Model with periodic boundary conditions */
/* Code adapted from http://gold.cchem.berkeley.edu/~acpan/220A/2DIsing.c and N. Bluemer*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/*************************
 * Constant Declarations *
 ************************/
#define NMAX 20            /* Lattice size (i.e. NMAX x NMAX) */

#define J 1.0             /* Ising lattice coupling constant 
			    J > 0: Ferromagnetic 
			    J < 0: Antiferromagnetic */
#define H 0.0              /* Ising lattice field strength */

void error(char error_text[])
/* standard error handler */
{
    fprintf(stderr,"\n%s run-time error\n",PROGNAME);
    fprintf(stderr,"--%s--\n",error_text);
    fprintf(stderr,"for general help use option -h\n");
    fprintf(stderr,"...now exiting to system...\n");
    exit(1);
}

void random_init(int mag[NMAX][NMAX], int L)
{
  int i,j;
  
  for(i = 0; i < L; i++)
    for(j = 0; j < L; j++)
      {
	if(drand48() > 0.5)
	  mag[i][j] = 1;
	else
	  mag[i][j] = -1;
      }
}

void outputmag(int mag[NMAX][NMAX], int L)
{
  int i,j;

  printf("\n");

  for(i = 0; i < L; i++)
    {
      for(j = 0; j < L; j++)
	{
	  if(mag[i][j] == -1)
	    printf("* ");
	  else
	    printf("  ");
	}
      printf("\n");
    }
}

double mag_av(int mag[NMAX][NMAX], int L)
/* computes average magnetization */
{
  int i,j;
  double x;

  x=0.0;

  for(i = 0; i < L; i++)
    for(j = 0; j < L; j++)
      x+=1.0*mag[i][j];
  x=x/(L*L);
  return(x);
}

void printhelp ()
{
 printf("**********************************************************\n");
 printf("%s: Metropolis Monte Carlo for 2D Ising model\n",PROGNAME);
 printf("Version: %s, %s by %s\n",VERSION,DATE,AUTHOR);
 printf("based on http://gold.cchem.berkeley.edu/~acpan/220A/2DIsing.c\n");
 printf("options: -T temperature (really: k_B T/|J|)\n");
 printf("         -L linear dimension of lattice (L<=%d)\n",NMAX);
 printf("         -w# number of initialization sweeps\n");
 printf("         -n# number of measurement sweeps\n");
 printf("         -c print configurations\n");
 printf("         -h this help\n");
}

/***********************************************************/
int main(int argc, char *argv[])
{
  /*************************
   * Variable Declarations *
   ************************/
  int mag[NMAX][NMAX];           /* 2D Ising Lattice */
  int i, j, k;                   /* Loop counters */
  int s,d;                       /* Lattice spin variables */  
  double Energy;                 /* Total lattice energy */
  int Inn[8] = {1,-1,0,0,1,1,-1,-1};       /* Nearest neighbor array I */
  int Jnn[8] = {0,0,1,-1,1,-1,1,-1};       /* Nearest neighbor array J */
  int Inew, Jnew;                /* Nearest neighbot indices */ 
  double Etemp, deltaE;          /* Temp energy variables for MC moves */ 
  int accept = 0;                /* Number of accepted moves */
  int move = 0;                  /* Number of moves total */ 

  char c;
  double T;                      /* temperature (in units of J/k_B) */
  double beta;
  int sweeps;                    /* number of measurement sweeps */
  int warm;                      /* number of warm-up sweeps */
  int print_conf;                /* flag for printing configurations */
  int L;                         /* lattice dimension */


  /***************************
   * Initialization          *
   ***************************/
  T=1.5;
  sweeps=100;
  print_conf=0;
  L=NMAX;

  while (--argc > 0 && (*++argv)[0] == '-')
    while (c= *++argv[0])
	   switch (c) {
	   case 'n':
 	     sscanf(++argv[0],"%d\n",&sweeps); 
             break;
	   case 'w':
 	     sscanf(++argv[0],"%d\n",&warm); 
             break;
	   case 'L':
 	     sscanf(++argv[0],"%d\n",&L); 
             if (L>NMAX) error ("L too large");
             break;
           case 'T':
 	     sscanf(++argv[0],"%lf\n",&T); 
             break;
           case 'c':
             print_conf=1;
             break;
	   case 'h':
	     printhelp();
	     exit(0);
             break;
/*  	   default:  */
/*  	     error("No valid choice");  */
	   }

  beta=1.0/T;
  printf("# L=%d, T=%f, n=%d, print_conf=%d\n", L, T, sweeps, print_conf);
  printf("# magnetization/site, energy/site\n");

  /* Seed the random number generator */
  srand48((unsigned int) time(NULL) - (time(NULL)/100000)*100000);

  /* Generate random initial configuration */
  random_init(mag, L);

  /* Determine the energy initially */
  Energy = 0.0;
  
  for(i=0;i<L;i++)
    for(j=0;j<L;j++)
      {
	/* Loop over nearest neighbors */
	for(k=0;k<8;k++)  
	  {
	    Inew = i + Inn[k];       
	    Jnew = j + Jnn[k];
	  
	    /* Check periodic boundary conditions */
	    if(Inew < 0)
	      Inew = L-1;
	    else if(Inew >= L)
	      Inew = 0;
	    
	    if(Jnew < 0)
	      Jnew = L-1;
	    else if(Jnew >= L)
	      Jnew = 0;
	    
	    /* Update the energy */
	    Energy += -J * mag[i][j] * mag[Inew][Jnew];
	  }
	/*Calculate the contribution from the field H */
	Energy += 2*H*mag[i][j];
      }
  
  /* Account for double counting */
  Energy /= 2.0;
	
  /* Monte Carlo Initialization */
  for(i=0;i<warm;i++)
    {
      for(j=0;j<L*L;j++)
	{
    /* ToDO: put Metropolis update etc here !!!!!!!!!!!!!!!!!!! */
	}
    }
  
  /*************************** 
   * The Run                 * 
   ***************************/
  for(i=0;i<sweeps;i++){

    /* ToDo: put Metropolis update etc here !!!!!!!!!!!!!!!!!!! */

      /* COLLECT DATA HERE */
      printf ("%9.6lf  %9.6lf\n", mag_av(mag,L), Energy/(L*L));
    }

  /*****************************
   * Output data and shut down *                 
   ****************************/

  /* OUTPUT DATA HERE */
  if (print_conf>0)
    outputmag(mag, L);

  /*Ratio of accepted spin flips compared to total attempted flips*/
  printf("# Acceptance rate: %2.1f %%\n", 100.0*accept/move);
}

