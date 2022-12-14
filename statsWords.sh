#!/bin/bash

function palabraMasCorta {
	LONG_MAS_CORTA=100
	PALABRA_MAS_CORTA=""
	for PALABRA in $(cat $1 | tr -d [:punct:] | tr -d [:digit:])
	do		
		LONG_PALABRA=${#PALABRA}
		if [ $LONG_PALABRA -lt $LONG_MAS_CORTA ]; then
			LONG_MAS_CORTA=$LONG_PALABRA
			PALABRA_MAS_CORTA=$PALABRA
		fi	
	done
	
	echo "====================================================================="
	echo "La palabra más corta del texto es: '$PALABRA_MAS_CORTA' y tiene $LONG_MAS_CORTA letra/s"	
}


function palabraMasLarga {
        LONG_MAS_LARGA=0
        PALABRA_MAS_LARGA=""
        for PALABRA in $(cat $1 | tr -d [:punct:] | tr -d [:digit:])
        do
                LONG_PALABRA=${#PALABRA}
                if [ $LONG_PALABRA -gt $LONG_MAS_LARGA ]; then
                        LONG_MAS_LARGA=$LONG_PALABRA
                        PALABRA_MAS_LARGA=$PALABRA
                fi
        done

        echo "====================================================================="
        echo "La palabra más larga del texto es: '$PALABRA_MAS_LARGA' y tiene $LONG_MAS_LARGA letras"
}


function promLongPalabras {
	CANT_PALABRAS=$(cat $1 | tr -d [:punct:] | tr -d [:digit:] | wc -w)
	echo "====================================================================="
      	echo "Cantidad de palabras:" $CANT_PALABRAS
	
	CANT_LETRAS=$(cat $1 | tr -d [:space:] | tr -d [:punct:] | tr -d [:digit:] | wc -m)
	echo "====================================================================="
	echo "Cantidad de letras:" $CANT_LETRAS

	PROM_PALABRAS=$(($CANT_LETRAS / $CANT_PALABRAS))
	echo "====================================================================="
	echo "El promedio de longitud de las palabras es de $PROM_PALABRAS letras"
	echo "====================================================================="
}

cat $1
palabraMasCorta $1
palabraMasLarga $1
promLongPalabras $1

exit 0
