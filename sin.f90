PROGRAM Sine
  IMPLICIT NONE
  INTEGER :: Count ! # de términos usados
  REAL :: Term ! un término
  REAL :: Sum ! la suma
  REAL :: X ! el input x
  REAL, PARAMETER :: Tolerance = 0.00001 ! tolerancia

  READ(*,*) X ! lee en x
  Count = 0 ! inicializa el contador
  Sum = 0.0 ! así, la suma empieza en 0
  Term = X ! el primer término es x

  DO ! para cada término
    IF (ABS(Term) < Tolerance) EXIT ! si es muy pequeño, exit
    Sum = Sum + Term ! de otra manera, aumenta a sum
    Count = Count + 1 ! cuenta que indica el siguiente término
    Term = Term * (-X**2 / ((2 * Count) * (2 * Count + 1))) ! calcula el valor del siguiente término
  END DO

  WRITE(*,*) 'After ', Count, ' iterations:'
  WRITE(*,*) ' Sin(', X, ') = ', Sum
  WRITE(*,*) ' From SIN() = ', SIN(X)
  WRITE(*,*) ' Abs(Error) = ', ABS((Sum - SIN(X)) / SIN(X))
END PROGRAM Sine
