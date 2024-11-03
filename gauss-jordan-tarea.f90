MODULE gauss_jordan_mod
    IMPLICIT NONE
CONTAINS

    !************************************************************************
    SUBROUTINE leer_matriz(A, n)
        IMPLICIT NONE
        INTEGER, INTENT(OUT) :: n
        REAL(8), DIMENSION(:,:), ALLOCATABLE, INTENT(OUT) :: A
        INTEGER :: i, j

        ! Leer el número de ecuaciones
        PRINT *, "Introduzca el número de ecuaciones:"
        READ *, n

        ALLOCATE(A(n, n+1))

        PRINT *, "Introduzca la matriz (tamaño ", n, "x", n+1, "):"
        DO i = 1, n
            READ (*,*) (A(i,j), j=1,n+1)
        END DO
    END SUBROUTINE leer_matriz

    !************************************************************************
    SUBROUTINE eliminacion_gauss_jordan(A, n, X)
        IMPLICIT NONE
        REAL(8), DIMENSION(:,:), INTENT(INOUT) :: A
        REAL(8), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: X
        INTEGER, INTENT(IN) :: n
        REAL(8), DIMENSION(:), ALLOCATABLE :: temp_row
        REAL(8) :: max_val, m
        INTEGER :: i, j, k, p, max_index

        ALLOCATE(X(n))
        ALLOCATE(temp_row(n+1))

        DO i = 1, n-1
            max_val = ABS(A(i,i))
            max_index = i

            DO j = i+1, n
                IF (ABS(A(j,i)) > max_val) THEN
                    max_val = ABS(A(j,i))
                    max_index = j
                END IF
            END DO

            IF (max_index /= i) THEN
                temp_row = A(i,:)   
                A(i,:) = A(max_index,:) 
                A(max_index,:) = temp_row
            END IF

            DO j = i+1, n
                m = A(j,i) / A(i,i)
                A(j,:) = A(j,:) - m * A(i,:)
            END DO
        END DO

        X(n) = A(n,n+1) / A(n,n)
        DO i = n-1, 1, -1
            X(i) = (A(i,n+1) - SUM(A(i,i+1:n) * X(i+1:n))) / A(i,i)
        END DO
    END SUBROUTINE eliminacion_gauss_jordan

END MODULE gauss_jordan_mod

PROGRAM Gauss_Jordan
    USE gauss_jordan_mod
    IMPLICIT NONE
    REAL(8), DIMENSION(:,:), ALLOCATABLE :: A
    REAL(8), DIMENSION(:), ALLOCATABLE :: X
    INTEGER :: n

    CALL leer_matriz(A, n)
    
    CALL eliminacion_gauss_jordan(A, n, X)
    
    PRINT *, "La solución es:"
    PRINT *, X
    
END PROGRAM Gauss_Jordan
