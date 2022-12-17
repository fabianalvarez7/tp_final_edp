#!/usr/bin/env bash

#REGEX=[]$

function statsSentences {
	echo "========================================================="
	cat $1 | tr '.' '\n' | tr '?' '\n' | tr '!' '\n' | awk 'NF' > temporal.txt
      	
	LONG_MIN=10000
	LONG_MAX=0
	CONT_CARACTERES=0
	CONT_ORACIONES=0
	ORACION_MIN=""
	ORACION_MAX=""

	# Recorremos el archivo línea por línea
	while read LINEA; do
    	
		# Verificamos la longitud de la línea
    		LONG=${#LINEA}
    	
		# Actualizamos las variables
   		if [ $LONG -lt $LONG_MIN ]; then
        		LONG_MIN=$LONG
			ORACION_MIN=$LINEA
    		fi

    		if [ $LONG -gt $LONG_MAX ]; then
			LONG_MAX=$LONG
			ORACION_MAX=$LINEA
    		fi

    		CONT_CARACTERES=$((CONT_CARACTERES + LONG))
    		CONT_ORACIONES=$((CONT_ORACIONES + 1))
	done < temporal.txt

	PROMEDIO=$(($CONT_CARACTERES / $CONT_ORACIONES))

	# Mostramos los resultados
	echo "La oración más corta es: '$ORACION_MIN' y tiene $LONG_MIN caracter/es"
	echo "La oración más larga es: '$ORACION_MAX' y tiene $LONG_MAX caracteres"
	echo "El promedio de longitud de todas las oraciones es de $PROMEDIO caracteres"
	echo "========================================================="
}

statsSentences $1

rm -f temporal.txt

exit 0
