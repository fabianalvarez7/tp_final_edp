#!/bin/bash

PS3='Elija una opción--> '

echo "=========================================================="
echo "=========================================================="
echo "SCRIPTS PARA PROCESAMIENTO DE TEXTO"

select opcion in "statsWords" "statsUsageWords" "findNames" "statsSentences" "blankLinesCounter" "SALIR"
do
	[ -e $opcion ] && echo "Elegir opcion válida!" && continue
	[ $REPLY == 6 ] && echo "Hasta luego" && break

	echo "Script elegido: " $opcion
	./${opcion}.sh
done

echo "=========================================================="
echo "=========================================================="
exit 0

