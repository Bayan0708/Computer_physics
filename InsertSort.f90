program InsertSortProgram
  ! Declaro variables
  implicit none
  integer, parameter :: n = 7
  integer :: i, ipiv
  integer :: xpiv
  integer :: x(n)

  ! Ponemos el arreglo x
  x = (/20, 30, 90, 70, 60, 10, 40/)

  ! Imprimimos array original con una subrutina
  call printArray(x, n)

  ! Llamamos al procedimiento InsertSort
  call InsertSort(x, n)

  ! Imprimimos el array ordenado con la misma subrutina
  call printArray(x, n)

contains

  ! Procedimiento para ordenar el array
  subroutine InsertSort(x, n)
    integer, intent(inout) :: x(n)
    integer, intent(in) :: n
    integer :: i, ipiv, xpiv

    do ipiv = 2, n
      xpiv = x(ipiv)
      i = ipiv - 1
      do while (i >= 1 .and. x(i) > xpiv)
        x(i+1) = x(i)
        i = i - 1
      end do
      x(i+1) = xpiv
    end do
  end subroutine InsertSort

  ! Procedimiento para imprimir el array
  subroutine printArray(x, n)
    integer, intent(in) :: x(n)
    integer, intent(in) :: n
    integer :: i

    do i = 1, n
      write(*,'(I5)', advance='no') x(i)
    end do
    print *
  end subroutine printArray

end program InsertSortProgram
