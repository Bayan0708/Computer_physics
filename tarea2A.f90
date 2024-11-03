program chicharronera_compleja
    implicit none
    complex*16 :: aa, bb, cc, x1, x2, dis
    real(8) :: real_a, imag_a, real_b, imag_b, real_c, imag_c

    print*, 'Ingrese la parte real de a:'
    read*, real_a
    print*, 'Ingrese la parte imaginaria de a:'
    read*, imag_a

    print*, 'Ingrese la parte real de b:'
    read*, real_b
    print*, 'Ingrese la parte imaginaria de b:'
    read*, imag_b

    print*, 'Ingrese la parte real de c:'
    read*, real_c
    print*, 'Ingrese la parte imaginaria de c:'
    read*, imag_c

    aa = cmplx(real_a, imag_a)
    bb = cmplx(real_b, imag_b)
    cc = cmplx(real_c, imag_c)

    dis = bb**2 - 4.0d0 * aa * cc

    x1 = (-bb + sqrt(dis)) / (2.0d0 * aa)
    x2 = (-bb - sqrt(dis)) / (2.0d0 * aa)

    print*, 'La primera raíz es: ', real(x1), ' + ', aimag(x1), 'i'
    print*, 'La segunda raíz es: ', real(x2), ' + ', aimag(x2), 'i'

end program chicharronera_compleja
