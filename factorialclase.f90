integer :: i,j
real :: fact
do i=1,10
call factorial(i,fact)
print*, fact
end do
end program
subroutine factorial(n,x)
integer :: n,i
real :: x
x=1.0
Do i=1,n
x=x*i
end do
end subroutine factorial
