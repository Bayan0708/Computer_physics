character*80  ::arga
complex(8)  ::a(6)
complex*16 ::aa,bb,cc

call getarg( 1, arga )
read(arga,*)a(1)
call getarg( 2, arga )
read(arga,*)a(2)
call getarg( 3, arga )
read(arga,*)a(3)

print*,a(1)
print*,a(2)
print*,a(3)

end program

