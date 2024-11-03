PROGRAM Cosine
IMPLICIT NONE
INTEGER :: Count ! Número de términos usados
REAL :: Term ! Un término
REAL :: Sum ! La suma
REAL :: X ! El valor de entrada x
REAL, PARAMETER :: Tolerance = 0.00001 ! Tolerancia

READ(*,*) X ! Leer el valor de x 

! Inicializar los valores
Count = 0
Sum = 1.0 ! El primer término es 1
Term = 1.0 ! Termino inicial es 1

DO
    ! Calcular la serie
    Term = Term * (-X**2) / ((2*Count+1) * (2*Count+2))
    
    ! Si el término es menor que la tolerancia, salir del bucle
    IF (ABS(Term) < Tolerance) EXIT
    
    ! Sumar el término a la suma total
    Sum = Sum + Term
    
    ! Incrementar el contador
    Count = Count + 1
END DO

! Mostrar los resultados
WRITE(*,*) 'Después de', Count, 'iteraciones:'
WRITE(*,*) ' Cos(', X, ') = ', Sum
WRITE(*,*) ' De COS() = ', COS(X)
WRITE(*,*) ' Error Absoluto = ', ABS(Sum - COS(X))

END PROGRAM Cosine

