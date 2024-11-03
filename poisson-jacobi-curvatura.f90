PROGRAM Curvatura
!-----------------------------------------------------------------------
!Programa que obtiene una solución aproximada a la ecuación de Poisson 
!a partir del método de elementos finitos, en particular para hallar la
!curvatura de una tabla cuando una persona se sienta en el medio.
!Se resuelve un sistema de ecuaciones lineales con el método de Jacobi. 
!-----------------------------------------------------------------------

!			D E C L A R A C I O N E S
IMPLICIT NONE
INTEGER :: n, j, k
REAL(8) :: I, h
REAL(8), DIMENSION(:), ALLOCATABLE :: x, u, f
REAL(8), DIMENSION(:,:), ALLOCATABLE :: R
REAL(8), PARAMETER :: Y=1E9, t=0.03d0, w=0.2d0, f0=200.d0, x0=0.25d0, L=3.d0, g=9.81d0, rho=3.d0

!			P R O G R A M A   P R I N C I P A L

PRINT*, "Escribe cuántos puntos de la solución deseas calcular: "
READ(*,*) n

ALLOCATE(x(n), u(n), f(n), R(n,n+1))
print*, "hasta aqui"
R=0.d0
DO j=1,n   !Inicializamos la llamada matriz de rigidez para este método.    
	if (j/=1) R(j,j-1)=1.d0
	R(j,j+1)=1.d0 !La presencia de un 1 en el elemento R(n,n+1) no importa
		      !debido a que se da el valor correcto más adelante.
	R(j,j)=-2.d0
END DO
DO k=1,n !Obtenemos los puntos del intervalo [0,L] en los que se calculará "u".
	x(k)=k*(L/real(n+1))
	!Este bucle considera las condiciones de frontera. Sólo se trabaja con
	!los puntos que no son el inicial y el final.
END DO

h=L/(n+1.0) !Este es el tamaño del paso, es decir, la longitud de cada parte del intervalo.
I=(t**3)*(w/3) !Factor de forma.

CALL Distfuerza(x,n,f)

f=f/(Y*I) !Hacemos la división correspondiente para tener la función correcta
	  !en la ecuación diferencial.

DO j=1,n !Llenamos la última columna de la matriz de rigidez aumentada.
	R(j,n+1)=(h**2)*f(j)
END DO
CALL Jacobi(R,n,x,u)

END PROGRAM Curvatura

!	S U B R U T I N A :   D I S T R I B U C I Ó N    D E   F U E R Z A

SUBROUTINE Distfuerza(x,n,f)
INTEGER :: n, j, k
REAL(8), DIMENSION(n) :: x, f
REAL(8), PARAMETER :: Y=1E9, t=0.03d0, w=0.2d0, f0=200.d0, x0=0.25d0, L=3.d0, g=9.81d0, rho=3.d0

DO j=1,n !Este bucle calcula el valor de la función en cada elemento de x.
	!Condicionales para definir la función a trozos.
	IF (ABS(x(j) - L/2.) <= x0) THEN
		f(j)=f0*(EXP(-(((x(j)-L/2.d0)**2)/(x0))) - EXP(-1.d0)) + rho*g
	ELSE
		f(j)=rho*g
	END IF
END DO
END SUBROUTINE Distfuerza

!	S U B R U T I N A :   M É T O D O   D E   J A C O B I

SUBROUTINE Jacobi(R,n,x,u)
REAL(8), DIMENSION(n,n+1) :: R
INTEGER :: j, k, l, m
REAL(8), DIMENSION(n) :: x, u, u0
REAL(8) :: suma, iniciox=0.0, finx=3.0, iniciou=0.0, finu=0.0

!Hemos declarado las condiciones de frontera en esta subrutina, solamente con el
!fin de escribirlas en el archivo de datos y poder graficar.

u0=0
l=1
DO !Un DO así permite alcanzar la tolerancia sin límite de iteraciones.
	DO j=1,n
	suma=0
		DO k=1,n
			IF(k/=j) THEN
				suma=suma+R(j,k)*u0(k)
			END IF
		END DO
		u(j)=(-suma+R(j,n+1))/R(j,j)
	END DO

	IF(MAXVAL(ABS(u-u0))<1E-8) THEN
		PRINT*, 'Calculados los puntos de la solución u.'
		PRINT*, 'Se encuentran en el archivo curvatura.dat junto con'
		PRINT*, 'los datos de posición (columna 1).'
		!Añadimos la escritura de un archivo con los datos buscados.
		!Esto debido a que STOP detiene por completo al programa.
		OPEN(UNIT=9, FILE='curvatura.dat', STATUS='UNKNOWN')
			WRITE(9,*) iniciox, iniciou
			DO m=1,n
				WRITE(9,*) x(m), u(m)
			END DO
			WRITE(9,*) finx, finu
		CLOSE(9)
		print*, l
		STOP
	END IF
	u0=u
	l=l+1

END DO
END SUBROUTINE Jacobi
