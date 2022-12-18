#!/usr/bin/env bash

function palabraMasCorta {
	LONG_MAS_CORTA=100
	PALABRA_MAS_CORTA=""
	for PALABRA in $(cat $1 | tr -d [:punct:] | tr -d '¿' | tr -d '¡' | tr -d [:digit:])
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
        for PALABRA in $(cat $1 | tr -d [:punct:] | tr -d '¿' | tr -d '¡' | tr -d [:digit:])
        do
                LONG_PALABRA=${#PALABRA}
                if [ $LONG_PALABRA -gt $LONG_MAS_LARGA ]; then
                        LONG_MAS_LARGA=$LONG_PALABRA
                        PALABRA_MAS_LARGA=$PALABRA
                fi
        done

        echo "La palabra más larga del texto es: '$PALABRA_MAS_LARGA' y tiene $LONG_MAS_LARGA letras"
}


function promLongPalabras {
	CANT_PALABRAS=$(cat $1 | tr -d [:punct:] | tr -d '¿' | tr -d '¡' | tr -d [:digit:] | wc -w)
	CANT_LETRAS=$(cat $1 | tr -d [:space:] | tr -d [:punct:] | tr -d '¿' | tr -d '¡' | tr -d [:digit:] | wc -m)
	PROM_PALABRAS=$(($CANT_LETRAS / $CANT_PALABRAS))
	echo "El promedio de longitud de las palabras es de $PROM_PALABRAS letras"
	echo "====================================================================="
}

palabraMasCorta $1
palabraMasLarga $1
promLongPalabras $1

exit 0
