double precision :: M(2,2),b(2),x(2)

M(1,1)=2; M(1,2)=3
M(2,1)=1; M(2,2)=-2

b(1)=20; b(2)=3

call solve2x2(M,2,b,x)
print*, x

end program



subroutine solve2x2(A,n,b,dx)
double precision :: num0, num1, det
double precision :: A(n,n),b(n),dx(n)

num0 = a(2,2)*b(1) - a(1,2)*b(2)
num1 = a(1,1)*b(2) - a(2,1)*b(1)
det = a(1,1)*a(2,2)- a(1,2)*a(2,1)

if (det .eq. 0.d0 ) print*, "resolviendo 2X2: det=0"

dx(1) = num0/det
dx(2) = num1/det

end subroutine solve2x2
