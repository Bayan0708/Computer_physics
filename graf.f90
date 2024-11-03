integer   :: i,n
real(8)      :: a,b,f,x

x=0.d0
Do i=1,10000
  x=x+0.001d0
  f=sin(x+exp(x))
  write(*,*) x,f
end do
end program

