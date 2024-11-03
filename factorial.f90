integer  :: i,j,n
real(16):: fact
! programa que calcula el factorial de un numero 
write(*,*) "Dame un numero"
read(*,*) N
fact=1.q0
Do I=1,N
   fact=fact*i
End do

print*, N,"! =",fact
end program

