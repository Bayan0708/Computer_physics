PROGRAM Cosine
    IMPLICIT NONE
    REAL :: X, Sum, Term, Tolerance
    INTEGER :: Count

    ! Fijar la tolerancia en 0.00001
    Tolerance = 0.00001

    ! Leer el valor de X
    WRITE(*,*) 'Ingresa el valor de X:'
    READ(*,*) X

    ! Inicializar los valores
    Count = 0
    Sum = 1.0 ! El primer término es 1 (cos(0) = 1)
    Term = 1.0 ! Término inicial es 1

    DO
        ! Incrementar el contador
        Count = Count + 1

        ! Calcular el siguiente término de la serie de Taylor llamando a la función factorial
        Term = (-1.0)**Count * X**(2 * Count) / factorial(2 * Count)

        ! Sumar el término a la suma total
        Sum = Sum + Term

        ! Si el término es menor que la tolerancia, salir del bucle
        IF (ABS(Term) < Tolerance) EXIT
    END DO

    ! Mostrar los resultados
    WRITE(*,*) 'Después de', Count, 'iteraciones:'
    WRITE(*,*) ' Cos(', X, ') = ', Sum
    WRITE(*,*) ' Valor real de COS() = ', COS(X)
    WRITE(*,*) ' Error Absoluto = ', ABS(Sum - COS(X))

CONTAINS

    FUNCTION factorial(n) RESULT(fact)
        IMPLICIT NONE
        INTEGER, INTENT(IN) :: n
        INTEGER :: fact, i

        fact = 1
        DO i = 1, n
            fact = fact * i
        END DO

    END FUNCTION factorial

END PROGRAM Cosine

