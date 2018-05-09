#!/bin/bash

#EJECUCION ./5sh nombreCarpeta o ficheros para hacer copia de seguridad

tim=$(date +%s) #Obtiene la fecha actual

let a=0

for f	
do
	if [ -e "$f" ];	then #Es fichero?
		ficheros[$a]="$f" #Si es fichero lo guarda en un array para la copia de seguridad
		let a+=1
	fi
done


nombreCopia=$(echo "copia-$USER-$(date +%s).tar.gz") #Nombre de la copia de seguridad
tar -cf $nombreCopia ${ficheros[*]} #Se crea la copia de seguridad

if [ ! "-d" ~/Copia ]; then
	echo "Creando la carpeta de copia"
	mkdir ~/Copia #Se crea la carpeta temporal
fi


mv $nombreCopia ~/Copia

for x in $(find ~/Copia )
do

	if [ -f $x ]; then 

		seg=$(stat -c %Y $x)	
		let " tiempo = $tim - $seg"
		if [ $tiempo -ge 200 ]; then #Si los segundos desde la ultima modificación es mayor que 200 borra la copia de seguridad
			echo "Borrando $x de $tiempo segundos..."
			rm $x
		fi
	fi
done


echo "La copia de seguridad se ha creado correctamente"