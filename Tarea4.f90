program Tarea4
    implicit none
    real :: a, b, c, discriminante, raiz1, raiz2
    print *, 'Introduce los coeficientes a, b y c:'
    read *, a, b, c
    discriminante = b**2 - 4.0 * a * c
    if (discriminante == 0.0) then
        raiz1 = -b / (2.0 * a)
        print *, 'Hay una raíz doble: ', raiz1
    else if (discriminante < 0.0) then
        print *, 'No hay raíces'
    else
        raiz1 = (-b + sqrt(discriminante)) / (2.0 * a)
        raiz2 = (-b - sqrt(discriminante)) / (2.0 * a)
        print *, 'Existen dos raíces: ', raiz1, ' y ', raiz2
    end if
end program Tarea4
