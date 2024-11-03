! This program uses the bisection method to find the root of
! f(x)=exp(x)*ln(x)-x*x=0.
!
INTEGER                      ::  ISTEP
DOUBLE PRECISION,PARAMETER   ::  DL = 1.0E-06
DOUBLE PRECISION             ::  DX, F,X,X0
DOUBLE PRECISION             ::      A  = 1.0
DOUBLE PRECISION             ::      B  = 2.0
      DX = B - A
      ISTEP = 0
      DO 
        if (ABS(DX) < DL) exit
        X0 = (A+B)/2.0
        IF ((F(A)*F(X0)).LT.0) THEN
          B  = X0
          DX = B - A
        ELSE
          A  = X0
          DX = B - A
        END IF
        ISTEP = ISTEP + 1
     END DO
      write (*,*) "# pasos    raiz aprox.     Dx   Funcion evaluada" 
      WRITE (*,'(I4,3F16.8)') ISTEP,X0,DX,F(X0)
      STOP
!  999 FORMAT (I4,3F16.8)
END PROGRAM 
!
 FUNCTION F(X) !RESULT (dev)
        double precision :: x,F
        F = EXP(X)*LOG(X) - X*X
 END FUNCTION
