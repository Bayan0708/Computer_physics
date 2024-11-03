real :: V,r,pi
real(8) :: V1, r1,pi1
real(16) :: V2,r2,pi2

r=1.5
r1=1.5d0
r2=1.5q0

pi=4.0*atan(1.0)
pi1=4.0d0*atan(1.d0)
pi2=4.q0*atan(1.q0)

V=4./3.*pi*r**3
v1=4.d0/3.d0*pi1*r1**3
v2=4.q0/3.q0*pi2*r2**3

print*, "precision sencilla",v
print*, "precision doble  ",v1
print*, "precision quadruple" , v2

end program

