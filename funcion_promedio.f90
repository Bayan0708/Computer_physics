real :: x(205),promedio
integer :: i

do i=1,205
 read(*,*) x(i)
end do 
print*, promedio(x,205)

end program

real function promedio(x,n)
integer, intent(in) :: n
real :: x(n)
promedio = sum(x)/n
end function promedio
