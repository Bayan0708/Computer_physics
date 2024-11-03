program tarea3B
  implicit none
  complex :: a, b, c, discriminante, x1, x2
  integer :: narg
  character(len=50) :: arg1, arg2, arg3

  ! Verificar el número de argumentos
  narg = iargc()
  if (narg /= 3) then
     print *, "Uso: ./programa (a_real,a_imag) (b_real,b_imag) (c_real,c_imag)"
     stop
  end if

  ! Vamos a leer los coeficientes desde los argumentos, utilizando call y get_command_argument
  call get_command_argument(1, arg1)
  call get_command_argument(2, arg2)
  call get_command_argument(3, arg3)

  ! Leemos los argumentos para convertirlos justamente en complejos
  read(arg1, *) a
  read(arg2, *) b
  read(arg3, *) c

  ! Discriminante
  discriminante = b**2 - cmplx(4.0, 0.0) * a * c

  ! Raíces
  x1 = (-b + sqrt(discriminante)) / (cmplx(2.0, 0.0) * a)
  x2 = (-b - sqrt(discriminante)) / (cmplx(2.0, 0.0) * a)

  ! Imprimir las raíces
  print *, "Las raíces son:"
  print *, "x1 =", x1
  print *, "x2 =", x2

end program tarea3B
