#!/bin/bash

xmin=0.001   # Valor inicial de x
r_min=2.8    # Valor mínimo de r
r_max=4.0    # Valor máximo de r
r_step=0.001 # Incremento en el valor de r

iterations=1000  # Total de iteraciones por valor de r
discard=200      # Número de iteraciones transitorias a descartar
output_file="bifurcacion.dat"  # Archivo de salida

# Limpiar el archivo de salida si ya existe
> $output_file

# Establecer precisión de bc para los cálculos
bc_precision=20

# Bucle sobre los valores de r
for r in $(seq $r_min $r_step $r_max)
do
  x=$xmin  # Reiniciar x para cada valor de r

  # Iterar para descartar los valores iniciales (transitorios)
  for i in $(seq 1 $discard)
  do
    x=$(echo "scale=$bc_precision; $r * $x * (1 - $x)" | bc -l)
  done

  # Iterar para almacenar los datos de interés (post-transitorio)
  for i in $(seq 1 $(($iterations - $discard)))
  do
    x=$(echo "scale=$bc_precision; $r * $x * (1 - $x)" | bc -l)
    # Guardar el valor de r y x en el archivo
    echo "$r $x" >> $output_file
  done
done

echo "Datos generados y guardados en $output_file"
