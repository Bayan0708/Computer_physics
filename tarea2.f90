program ecuacion_chicharronera
    implicit none
    real(4) :: a, b, c
    real(4) :: discriminante, parte_real, parte_imaginaria
    complex(4) :: raiz1, raiz2

    ! Entradas del usuario
    print *, "Ingrese el coeficiente a diferente de cero:"
    read *, a
    if (a == 0.0) then
        print *, "El coeficiente 'a' no puede ser cero."
        stop
    end if

    print *, "Ingrese el coeficiente b:"
    read *, b
    print *, "Ingrese el coeficiente c:"
    read *, c

    ! Discriminante
    discriminante = b**2 - 4.0 * a * c

    if (discriminante > 0.0) then
        ! Dos raíces reales distintas
        raiz1 = (-b + sqrt(discriminante)) / (2.0 * a)
        raiz2 = (-b - sqrt(discriminante)) / (2.0 * a)
        print *, "Las raíces son reales y distintas:"
        print *, "Raíz 1: ", raiz1
        print *, "Raíz 2: ", raiz2
    else if (discriminante == 0.0) then
        ! Una raíz real doble
        raiz1 = -b / (2.0 * a)
        print *, "La raíz es real y doble:"
        print *, "Raíz: ", raiz1
    else
        ! Dos raíces complejas conjugadas
        parte_real = -b / (2.0 * a)
        parte_imaginaria = sqrt(-discriminante) / (2.0 * a)
        raiz1 = cmplx(parte_real, parte_imaginaria)
        raiz2 = cmplx(parte_real, -parte_imaginaria)
        print *, "Las raíces son complejas conjugadas:"
        print *, "Raíz 1: ", raiz1
        print *, "Raíz 2: ", raiz2
    end if

end program ecuacion_chicharronera
