#!/bin/bash

#EJECUCIÓN: ./1.sh nombreCarpeta

varc=$(find -name "*.c" | wc -l) #Cuenta el número de ficheros .c que hay en la carpeta
varh=$(find -name "*.h" | wc -l) #Cuenta el número de ficheros .h que hay en la carpeta

echo "Tenemos $varc ficheros con extensión .c y $varh ficheros con extensión .h"

for x in $(find $1 -name "*.h" -or -name "*.c") #Busca los ficheros .c y .h que hay en la carpeta
do
	echo "El fichero $x tiene $(wc -l < $x) lı́neas y $(wc -c < $x) caracteres" #Cuenta el numero de lineas y carácteres que hay en cada fichero 

done | sort -nr -k 8 #ordenar en orden descendente la columna 8(caracteres)
