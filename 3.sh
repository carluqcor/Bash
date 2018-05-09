#!/bin/bash

#EJECUCION ./3.sh nombreCarpeta o ./3.sh nombreCarpeta RangValue1 RangValue2

#CAMBIAR LA RUTA DE LAS CARPETAS

if [ -d /home/carlos/Escritorio/Universidad/SegundoInformática/PAS/P1/Practica_1/FIn/luque_cordoba_Carlos_PASJun1718P1/pequeño ]; then #Si existe carpeta pequeño la borra
	echo "Borrando pequeño/..."
	$(rm -r pequeño/)
fi

if [ -d /home/carlos/Escritorio/Universidad/SegundoInformática/PAS/P1/Practica_1/FIn/luque_cordoba_Carlos_PASJun1718P1/mediano ]; then #Si existe carpeta mediano la borra
	echo "Borrando mediana/..."
	$(rm -r mediano/)
fi

if [ -d /home/carlos/Escritorio/Universidad/SegundoInformática/PAS/P1/Practica_1/FIn/luque_cordoba_Carlos_PASJun1718P1/grande ]; then #Si existe carpeta grande la borra
	echo "Borrando grande/..."
	$(rm -r grande/)
fi

echo "Creando directorios para ordenar los archivos..." #Crea las carpetas de nuevo para que no contengan nada
$(mkdir pequeño mediano grande)

for x in $(find $1 -name "*.*") 
do	
	if [ $2 ]; then
		let  "umbral1 = $2 + 0" 
		let  "umbral2 = $3 + 0"

		if [ $(stat -c %s $x) -lt $umbral1 ]; then
			$(cp $x pequeño/)
		fi

		if [ $(stat -c %s $x) -gt $umbral1 ]; then
			if [ $(stat -c %s $x) -lt $umbral2 ]; then
				$(cp $x mediano/)
			fi

		fi

		if [ $(stat -c %s $x) -gt $umbral2 ]; then
			$(cp $x grande/)

		fi

	else
		let  "umbral1 = 10000 + 0" 
		let  "umbral2 = 100000 + 0" 
		if [ $(stat -c %s $x) -lt $umbral1 ]; then
			$(cp $x pequeño/)
		fi

		if [ $(stat -c %s $x) -gt $umbral1 ]; then
			if [ $(stat -c %s $x) -lt $umbral2 ]; then
				$(cp $x mediano/)
			fi

		fi

		if [ $(stat -c %s $x) -gt $umbral2 ]; then
			$(cp $x grande/)

		fi
	fi

done 