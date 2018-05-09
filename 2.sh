#!/bin/bash

#EJECUCIÓN ./2.sh nombreCarpeta o ./2.sh nombreCarpeta Valor para comparar en el if
echo "Nombre,LongitudUsuario,FechaModificacion,FechaAcceso,Tamano,Bloques,Permisos,Ejecutable"

for x in $(find $1 -name "*.*") #busca todos los ficheros que tengan un punto
do	
	if [ $2 ]; then #Si existe el segundo argumento
		if [ "$(stat -c %s $x)" -ge "$2" ]; then	#Busca los ficheros con caracteres superiores al 2 argv
			if [ -x $x ]; then
				echo "$(basename $x); $(stat -c %u $x | wc -c); $(stat -c %y $x); $(stat -c %x $x); $(stat -c %s $x); $(stat -c %b $x); $(stat -c %A $x), 1"

			else
				echo "$(basename $x); $(stat -c %u $x | wc -c); $(stat -c %y $x); $(stat -c %x $x); $(stat -c %s $x); $(stat -c %b $x); $(stat -c %A $x), 0"
			fi
		fi
	else
		if [ -x $x ]; then #Si el fichero es ejecutable imprimirá un 1 al final
			echo "$(basename $x); $(stat -c %u $x | wc -c); $(stat -c %y $x); $(stat -c %x $x); $(stat -c %s $x); $(stat -c %b $x); $(stat -c %A $x), 1"

		else #Si no, imprimirá un 0
			echo "$(basename $x); $(stat -c %u $x | wc -c); $(stat -c %y $x); $(stat -c %x $x); $(stat -c %s $x); $(stat -c %b $x); $(stat -c %A $x), 0"
		fi
	fi
done | sort -n -k 5	