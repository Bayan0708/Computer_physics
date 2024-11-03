program legendre_interpolation
    implicit none
    integer :: n, i, j
    real :: x_interp, numer, denom, Q_nn
    real, allocatable :: x(:), f(:), Q(:,:)

    ! Paso 1: Definir el número de puntos de interpolación
    n = 5  ! Usaremos 6 puntos: x_0, x_1, x_2, x_3, x_4, x_5

    ! Paso 2: Asignar memoria para los vectores y la matriz
    allocate(x(0:n), f(0:n), Q(0:n, 0:n))

    ! Paso 3: Introducir los valores de x y f(x) manualmente
    ! Datos de entrada (x_0, x_1, x_2, x_3, x_4, x_5)
    x(0) = 1.0
    x(1) = 1.3
    x(2) = 1.6
    x(3) = 1.9
    x(4) = 2.2

    ! Datos de entrada correspondientes f(x_0), f(x_1), f(x_2), f(x_3), f(x_4)
    f(0) = 0.7651977
    f(1) = 0.6200860
    f(2) = 0.4554022
    f(3) = 0.2818186
    f(4) = 0.1103623

    ! Valor donde queremos evaluar la interpolación
    x_interp = 1.5  ! x donde se interpola el valor

    ! Paso 4: Inicializar la matriz Q con los valores f(x_i) en la primera columna
    do i = 0, n-1
        Q(i, 0) = f(i)
    end do

    ! Paso 5: Proceso iterativo de interpolación de Legendre
    do i = 1, n-1  ! Iteración sobre las filas (i)
        do j = 1, i  ! Iteración sobre las columnas (j)
            ! Obtener los valores de x_i y x_j
            numer = (x_interp - x(j-1)) * Q(i, j-1) - (x_interp - x(i-1)) * Q(j-1, j-1)
            denom = x(i-1) - x(j-1)
            Q(i, j) = numer / denom
        end do
    end do

    ! Paso 6: Imprimir el valor final Q_nn (el polinomio interpolado en x_interp)
    Q_nn = Q(n-1, n-1)
    print *, 'El valor interpolado Q_nn en x = ', x_interp, ' es: ', Q_nn

    ! Liberar la memoria reservada
    deallocate(x, f, Q)

end program legendre_interpolation
