MODULE gauss_jordan_mod
    IMPLICIT NONE
CONTAINS

    !************************************************************************
    SUBROUTINE leer_matriz(A, n)
        IMPLICIT NONE
        INTEGER, INTENT(OUT) :: n
        REAL(8), DIMENSION(:,:), ALLOCATABLE, INTENT(OUT) :: A
        INTEGER :: i, j

        ! Leer el tamaño de la matriz
        PRINT *, "Introduzca el tamaño de la matriz cuadrada:"
        READ *, n

        ! Ampliar la matriz de A(n,n) a A(n,2n) para añadir la identidad
        ALLOCATE(A(n, 2*n))

        PRINT *, "Introduzca los elementos de la matriz A (", n, "x", n, "):"
        DO i = 1, n
            READ (*,*) (A(i,j), j=1,n)
        END DO

        ! Añadir la matriz identidad en el lado derecho
        DO i = 1, n
            DO j = 1, n
                IF (i == j) THEN
                    A(i, n+j) = 1.0
                ELSE
                    A(i, n+j) = 0.0
                END IF
            END DO
        END DO
    END SUBROUTINE leer_matriz

    !************************************************************************
    SUBROUTINE gauss_jordan(A, n)
        IMPLICIT NONE
        REAL(8), DIMENSION(:,:), INTENT(INOUT) :: A
        INTEGER, INTENT(IN) :: n
        REAL(8), DIMENSION(:), ALLOCATABLE :: temp_row
        REAL(8) :: max_val, m
        INTEGER :: i, j, k, max_index

        ALLOCATE(temp_row(2*n))

        ! Eliminar para obtener la matriz identidad en la izquierda
        DO i = 1, n
            ! Búsqueda del pivote
            max_val = ABS(A(i,i))
            max_index = i
            DO j = i+1, n
                IF (ABS(A(j,i)) > max_val) THEN
                    max_val = ABS(A(j,i))
                    max_index = j
                END IF
            END DO

            ! Intercambiar filas si es necesario
            IF (max_index /= i) THEN
                temp_row = A(i,:)   
                A(i,:) = A(max_index,:) 
                A(max_index,:) = temp_row
            END IF

            ! Escalar la fila para que el pivote sea 1
            A(i,:) = A(i,:) / A(i,i)

            ! Eliminar las otras entradas en la columna i
            DO j = 1, n
                IF (j /= i) THEN
                    m = A(j,i)
                    A(j,:) = A(j,:) - m * A(i,:)
                END IF
            END DO
        END DO
    END SUBROUTINE gauss_jordan

    !************************************************************************
    SUBROUTINE imprimir_matriz_inversa(A, n)
        IMPLICIT NONE
        REAL(8), DIMENSION(:,:), INTENT(IN) :: A
        INTEGER, INTENT(IN) :: n
        INTEGER :: i, j

        PRINT *, "La matriz inversa es:"
        DO i = 1, n
            PRINT *, (A(i, n+j), j=1,n)
        END DO
    END SUBROUTINE imprimir_matriz_inversa

END MODULE gauss_jordan_mod

PROGRAM Inversa_Matriz
    USE gauss_jordan_mod
    IMPLICIT NONE
    REAL(8), DIMENSION(:,:), ALLOCATABLE :: A
    INTEGER :: n

    ! Leer la matriz
    CALL leer_matriz(A, n)
    
    ! Calcular la inversa usando Gauss-Jordan
    CALL gauss_jordan(A, n)
    
    ! Imprimir la matriz inversa
    CALL imprimir_matriz_inversa(A, n)
    
END PROGRAM Inversa_Matriz
