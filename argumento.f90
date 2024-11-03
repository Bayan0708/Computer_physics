character*80  ::arga
real*8  ::a(6)
complex*16 ::aa,bb,cc 

call getarg( 1, arga ) 
read(arga,*)a(1)
call getarg( 2, arga )
read(arga,*)a(2)
call getarg( 3, arga )
read(arga,*)a(3)
call getarg( 4, arga )
read(arga,*)a(4)
call getarg( 5, arga )
read(arga,*)a(5)
call getarg( 6,arga )
read(arga,*)a(6)
call getarg( 7, arga)
print*, arga
aa=cmplx(a(1),a(2))

print *,aa
print*, real(aa),aimag(aa)
print*,cmplx(a(3),a(4))
print*,cmplx(a(5),a(6))

end program 
