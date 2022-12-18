#!/usr/bin/env bash

echo "=========================================================="
echo "<<< APP PARA FILTRADO DE TEXTO >>>"
echo "=========================================================="

TEXTO=$1
read -p "Ingrese el nombre de un archivo de texto: " TEXTO
echo "=========================================================="

# Verificamos que el archivo fue pasado como argumento
[ -z $TEXTO ] && echo "Debe ingresar un archivo de texto como argumento" && exit 1

# Verificamos que el archivo existe
[ ! -e $TEXTO ] && echo "El archivo $TEXTO no existe" &&  exit 2

# Verificamos que el archivo de texto no esté vacío
[ ! -s $TEXTO ] && echo "El archivo de texto está vacío" && exit 3


opcion=0
echo "=========================================================="
while [ $opcion -ne 6 ]; do
	echo
	echo "¿Qué necesita?"
	echo "1. La palabra más corta, la más larga y el promedio de longitud de las palabras del texto" 
	echo "2. Las 10 palabras más usadas que tengan como mínimo 4 letras" 
	echo "3. Encontrar nombres propios" 
	echo "4. La oración más corta, la más larga y el promedio de longitud de las oraciones del texto" 
	echo "5. Contar las líneas en blanco que tiene el texto" 
	echo "6. SALIR"
	echo
	read -p "SELECCIONE UNA OPCIÓN: " opcion
	echo
	clear
	echo "=========================================================="
        echo "OPCIÓN ELEGIDA:" $opcion

	case $opcion in
		1) ./statsWords.sh $TEXTO ;;
		2) ./statsUsageWords.sh $TEXTO ;;
		3) ./findNames.sh $TEXTO ;;
		4) ./statsSentences.sh $TEXTO ;;
		5) ./blankLinesCounter.sh $TEXTO ;;
		6) echo "Saliendo de la app..."
		exit 0 ;;
		*) echo "La opción NO es válida"
		break ;;
	esac
done
echo "=========================================================="
