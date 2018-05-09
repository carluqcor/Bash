#!/bin/bash

#EJECUCION ./4sh nombreCarpeta

varc=$(find $1 -name "*.*" | wc -l)

echo "Hay $varc ficheros"

echo "------------------------------------------------------------------"

echo "Esta sería la lista de usuarios conectados en este momento: "
echo -e $(who | cut -d " " -f 1 | uniq -u) #Usuarios conectados actualmente, cortar cuando haya un espacio y no repetir nombres

echo "------------------------------------------------------------------"

echo "Introduzca el carácter a buscar: "; read -t 5 r #Leer r durante 5 segundos, si no time out

if [ ! $r ]; then #Si no se metio el valor r se tomará a como valor predeterminado
	r=$(echo "a")
	echo "TIMEOUT, valor predeterminado 'a'"
fi

for x in $(find $1 -type f -or -type d)  #Se buscan ficheros o subcarpetas que en el nombre contenga el carácter indicado por terminal
do	
	let "s+=$(echo $(basename $x) | tr -cd "$r" | wc -c)" #Busca el caracter en las carpetas que se van pasando en el for
done

echo "El caracter $r aparece $s veces en los ficheros o carpetas de la dirección actual"
echo "------------------------------------------------------------------"
