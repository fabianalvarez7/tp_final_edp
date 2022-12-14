#!/bin/bash

PS3="Elija una opción: "

echo "=========================================================="

echo "SCRIPTS PARA PROCESAMIENTO DE TEXTO"

TEXTO=$1

read -p "Ingrese el nombre de un archivo de texto: " TEXTO

# Verificamos que el archivo fue pasado como argumento
[ -z $TEXTO ] && echo "Debe ingresar un archivo de texto como argumento" && exit 1

# Verificamos que el archivo existe
[ ! -e $TEXTO ] && echo "El archivo $TEXTO no existe" &&  exit 2

# Verificamos que el archivo de texto no esté vacío
[ ! -s $TEXTO ] && echo "El archivo de texto está vacío" && exit 3

echo "=========================================================="

select opcion in "statsWords" "statsUsageWords" "findNames" "statsSentences" "blankLinesCounter" "SALIR"
do
	[ -e $opcion ] && echo "Elegir opcion válida!" && continue
	[ $REPLY == 6 ] && echo "Hasta luego" && break

	echo "Script elegido: " $opcion
	echo "=========================================================="
	./${opcion}.sh $TEXTO
done

echo "=========================================================="

exit 0

