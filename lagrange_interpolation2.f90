program lagrange_interpolation
    implicit none
! Definamos variables y arreglos .....................
    integer :: n, i, j
    real, allocatable :: x(:), f(:), Q(:,:)
    real :: punto, resultado

! Definnamos el número de puntos ..................................
    n = 4  ! Ajustamos el número de puntos a 4
    allocate(x(0:n), f(0:n), Q(0:n, 0:n))

! Los pondre manualmente los valores ..............................
    x(0) = 1.0
    x(1) = 1.3
    x(2) = 1.6
    x(3) = 1.9
    x(4) = 2.2
    f(0) = 0.7651977
    f(1) = 0.6200860
    f(2) = 0.4540220
    f(3) = 0.2818600
    f(4) = 0.1103623

! poner punto en el que se desea evaluar el polinomio ................
    print *, "Ingrese el valor de x:"
    read *, punto

! Inicializar la primera columna de la matriz Q con los valores de f(x) ......
    do i = 0, n
        Q(i, 0) = f(i)
    end do

 ! Llenar la matriz Q usando la relación de recurrencia............
    do j = 1, n
        do i = 0, n - j
            Q(i, j) = ((punto - x(i + j)) * Q(i, j - 1) - (punto - x(i)) * Q(i + 1, j - 1)) / (x(i) - x(i + j))
        end do
    end do

 ! El valor del polinomio interpolante en el punto dado es Q(0, n) ........
    resultado = Q(0, n)

    ! Imprimir el resultado .............
    print *, "El valor del polinomio interpolante en x =", punto, " es: ", resultado

    ! Liberar memoria asignada ..................
    deallocate(x, f, Q)

end program lagrange_interpolation
