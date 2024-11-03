program rotate_image_180_bmp
    implicit none
    integer, parameter :: nx = 225, ny = 225
    integer, parameter :: header_size = 54  ! Tamaño fijo del encabezado BMP
    integer :: i, j
    integer, dimension(nx, ny) :: image, rotated_image
    integer, dimension(header_size) :: bmp_header  ! Arreglo para almacenar el encabezado
    integer :: image_size
    character(len=1) :: pixel(3)  ! Para leer cada píxel RGB (3 bytes)
    character(len=30) :: input_file, output_file

    ! Nombres de los archivos
    input_file = 'Imagen_Profe.bmp'
    output_file = 'Imagen_Profe_giro180.bmp'

    ! Abrimos el archivo de imagen original
    open(unit=10, file=input_file, form='unformatted', status='old', access='stream')

    ! Leemos el encabezado del archivo BMP (primeros 54 bytes)
    read(10) bmp_header

    ! Abrimos el archivo de salida para la imagen rotada (usamos 'replace' para sobrescribir si ya existe)
    open(unit=20, file=output_file, form='unformatted', status='replace', access='stream')

    ! Escribimos el encabezado BMP en el archivo de salida
    write(20) bmp_header

    ! Leemos los datos de la imagen y la invertimos
    do i = ny, 1, -1
        do j = nx, 1, -1
            ! Leer cada píxel (3 bytes: RGB)
            read(10) pixel
            ! Escribir el píxel en la posición invertida
            write(20) pixel
        end do
    end do

    ! Cerramos ambos archivos
    close(10)
    close(20)

    print *, "La imagen ha sido rotada 180 grados y guardada en '", output_file, "'"

end program rotate_image_180_bmp
