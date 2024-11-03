integer   :: i,n
real*8      :: a,b,f,w,int
real*8      :: x(10000),y(10000)
w=0.0d0
Do i=1,10000
  w=w+0.001d0
  x(i)=w
  y(i)=sin(x(i)+exp(x(i)))
!  write(*,*) x(i),y(i)
end do
int=0.0d0
Do j=1,9999
   int=int+(x(j+1)-x(j))*y(j+1)
end do
print*, "integral= ",int
end program

