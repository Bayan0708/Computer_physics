program Tarea3A
  implicit none
  complex(8) :: a, b, c, discriminante, x1, x2  ! Declaración de variables complejas de doble precisión

  ! Solicitar al usuario que ingrese los coeficientes
  print*, "Ingrese los coeficientes a, b y c de la ecuación ax^2 + bx + c = 0 (como números complejos):"
  print*, "Ejemplo de entrada: (1.0,2.0) para 1 + 2i" !Agrego el ejemplo mientras me apredno el como se escribren.
  
  ! Leer los coeficientes a, b y c, tal como se indica para el problema
  read*, a, b, c

  ! discriminante
  discriminante = b**2 - (4.0_8 * a * c)

  ! raíces x1 y x2
  x1 = (-b + sqrt(discriminante)) / (2.0_8 * a)
  x2 = (-b - sqrt(discriminante)) / (2.0_8 * a)

  ! Imprimir las raíces
  print*, "Las raíces son:"
  print*, "Raíz 1:", x1
  print*, "Raíz 2:", x2
end program Tarea3A
