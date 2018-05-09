#!/bin/bash

#EJECUCION ./6.sh nombreCarpeta y cat nombreCarpeta.html (para mostrar)

function htmlrecur(){ #Se crea la función recursiva que se llamará asi misma
	for x in $(find $1 -maxdepth 1) 
	do
		if [ ! $x == $1 ]; then #Si el primer valor es la carpeta pasada por parámetro salta al siguiente elemento
		
			if [ -f $x ]; then
				echo "<li> $(echo $(echo $(readlink -f $1))"/"$x) </li> " >> $dir #IMprime si es fichero su destino readlink -f quita el / por lo que debe ponerse
			fi

			if [ -d $x ]; then
				echo "<li> <strong> $(echo $(echo $(dirname $(readlink -f $1)))"/"$x)</strong> </li> " >> $dir #Imprime si es directorio su destino readlink -f quita el / por lo que debe ponerse
				echo "<ul>" >> $dir
				htmlrecur $x $dir #Se llama asi misma para seguir siempre que haya directorios
			fi
		fi
	done 
	echo "</ul>" >> $dir
}

dir=$(echo $(basename $(readlink -f $1))$(echo ".html")) #Dirección del nombre del html

if [ -e $dir ]; then
	$(rm $dir)
fi

echo -e " <html>\n <head>\n <title>Listado del directorio $directorio/</title>\n </head>\n <body>\n <style type=\"text/css\">\n	body { font-family: sans-serif;}\n </style>\n <h1>Listado del directorio $directorio/</h1>" >> $dir

echo "<ul>" >> $dir
echo "<li> $(echo $(dirname $(readlink -f $dir))"/"$dir) </li> " >> $dir
htmlrecur $1 $dir

echo "</ul>" >> $dir
echo "</body>" >> $dir
echo "</html>" >> $dir