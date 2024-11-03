implicit none

integer :: i, j
real(16) :: a, b, w, int
real(16) :: x(10000), y(10000)

w = 0.0_16

do i = 1, 10000
  w = w + 0.001_16
  x(i) = w
  y(i) = sin(x(i) + exp(x(i)))
  ! write(*,*) x(i), y(i)
end do

int = 0.0_16

do j = 1, 9999
  int = int + (x(j+1) - x(j)) * (y(j+1) + y(j)) / 2.0_16
end do

print*, "integral= ", int

end program
