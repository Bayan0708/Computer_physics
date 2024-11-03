program lagrange_interpolation
    implicit none
    ! Variables
    integer :: n, i, j
    real, allocatable :: x(:), f(:), Q(:,:)
    real :: punto, resultado

    ! Definir número de puntos
    n = 3  ! Hay 4 puntos (0 a 3)
    allocate(x(0:n), f(0:n), Q(0:n, 0:n))

    ! Valores de x y f(x)
    x(0) = 1.0
    x(1) = 1.3
    x(2) = 1.6
    x(3) = 1.9
    f(0) = 0.7651977
    f(1) = 0.6200860
    f(2) = 0.4540220
    f(3) = 0.2818600

    ! Pedir el valor de x en el que se quiere evaluar el polinomio
    print *, "Ingrese el valor de x:"
    read *, punto

    ! Poner f(x) en la primera columna de la matriz Q
    do i = 0, n
        Q(i, 0) = f(i)
    end do

    ! Llenar la matriz Q usando la fórmula de interpolación
    do i = 1, n
        do j = 1, i
            Q(i, j) = ((punto - x(j - 1)) * Q(i, j - 1) - (punto - x(i)) * Q(j - 1, j - 1)) / (x(i) - x(j - 1))
        end do
    end do

    ! El resultado es Q(n, n)
    resultado = Q(n, n)

    ! Imprimir el resultado
    print *, "El valor del polinomio interpolante en x =", punto, " es: ", resultado

    ! Liberar memoria
    deallocate(x, f, Q)

end program lagrange_interpolation
