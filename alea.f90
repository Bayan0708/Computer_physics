! Utiliza el algoritmo Xoshiro128** , xoshiro256** , etc
! se caracteriza por su velocidad
! 
integer    :: n,i
real       :: r

n=10
Do i=1,n            ! en el do pueden ir variables
   r= rand(1)       ! funcion intriseca para gnerar numeros aleatorios entre 1,0
   print *, 'a la fortran 77' , r
!   call RANDOM_NUMBER(r) ! subrutina intriseca para generar numeros aleatorios 1,0, mucho mas sofisticado
!   print *, ' con subrutina intrinseca' , r
end do

end program

   
