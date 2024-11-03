integer :: i,j
real*16 :: x,r
! Ecuación logistica 
x=0.1q0
r=1.1q0
Do i=1,200
   x=r*x*(1.q0-x)
   write(*,*) x
end do

end program
