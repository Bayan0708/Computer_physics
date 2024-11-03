integer  :: i,j,n
real(16):: fact
! programa que calcula el factorial de un numero 
write(*,*) "Dame un numero"
read(*,*) N
fact=1.q0
Do j=2,N,2
fact=1.q0
Do I=1,j
fact=fact*i
End do
print*, j,"! =",fact
End do
end program
