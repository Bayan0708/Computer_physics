real  :: a
real(8)  :: b
real(16) :: pi
print*, "Como un string Pi=3.14159265358979328"
a=3.14159265358979328
print*, "variable a en precision sencilla ", a
b=3.14159265358979328
print*, "variable b en precision doble (aparentemente) ", b
b=3.14159265358979328d0
print*, "variable b en double precision",b
print*,dsin(b/4)
print*,sin(b/4)
print*, 4.0*atan(1.0d0)
pi=4.q0*atan(1.0q0)
print*, pi
end program


