#!/bin/bash


function statsSentences {
	# Verificamos que el archivo fue pasado como argumento
	if [ $# -ne 1 ]; then
    		echo "Debe ingresar un archivo de texto como argumento"
    		exit 1
	fi

	cat $1
	echo "========================================================="
	cat $1 | tr '.' '\n' | tr '?' '\n' | tr '!' '\n' | tr -d '[:punct:]' | tr -d '[:blank:]' | awk 'NF' > resultado.txt
	cat resultado.txt
	echo "========================================================="
      		
	MIN=10000
	MAX=0
	TOTAL=0
	CONTADOR=0

	# Recorremos el archivo línea por línea
	while read LINEA; do
    	
		# Verificamos la longitud de la línea
    		LONG=${#LINEA}
    	
		# Actualizamos las variables
   		if [ $LONG -lt $MIN ]; then
        		MIN=$LONG
    		fi

    		if [ $LONG -gt $MAX ]; then
			MAX=$LONG
    		fi

    		TOTAL=$((TOTAL + LONG))
    		CONTADOR=$((CONTADOR + 1))
	done < resultado.txt

	PROMEDIO=$(($TOTAL/$CONTADOR))

	# Mostramos los resultados
	echo "La oración más corta tiene $MIN caracter/es"
	echo "La oración más larga tiene $MAX caracteres"
	echo "El promedio de longitud de todas las oraciones es de $PROMEDIO caracteres"
	echo "========================================================="
}

statsSentences $1

rm -f resultado.txt

exit 0
