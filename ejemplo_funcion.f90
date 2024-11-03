integer,parameter          :: n=5
real :: x(n),y(n)
real :: b,m
do i=1,n
   read*, x(i),y(i)
end do
print*, "b=",ordenada(x,y,5)
print*, "m=",pendiente(x,y,5)
end program

function ordenada(x,y,n)
real :: x(n),y(n), ordenada
real :: b
b = (sum(y)*sum(x*x)-sum(x)*sum(x*y))/(n*sum(x*x)-sum(x)*sum(x))
ordenada=b
end function ordenada

function pendiente(x,y,n)
real :: x(n),y(n), pendiente
real :: m
m =(n*sum(x*y)-sum(x)*sum(y)) /(n*sum(x*x)-sum(x)*sum(x)) 
pendiente=m
end function pendiente

