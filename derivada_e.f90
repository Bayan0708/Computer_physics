        PROGRAM APROXIMACIONES_A_LA_DERIVADA
!****************************************************
!* Programa que muestra que no es trivial elegir una 
!* aproximacion a la derivada de la funcion e
!*
!****************************************************
        DOUBLE PRECISION     :: HK,FK,FK1,DFK
        PRINT*, '    H            EXP(X)       DERIVADA      DIFERENCIA'
        DO I=1,10
           HK=1.D0/10**I
           FK=EXP(1.D0+HK)
           FK1=FK-EXP(1.D0)
           DFK=(FK1/HK)
           PRINT "(2X,4F13.9)",HK,DFK,exp(1.d0),abs(DFK-exp(1.d0))
! 10        FORMAT(2X,4F13.9)
        ENDDO
        
        END PROGRAM APROXIMACIONES_A_LA_DERIVADA

        
