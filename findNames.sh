#!/usr/bin/env bash


function findNames {

	REGEX="^[A-Z][a-z]+$"
	
	echo "=========================================================="
	echo "Nombres propios encontrados:"

	for PALABRA in $(cat $1 | tr -d [:punct:] | tr -d '¡' | tr -d '¿' | tr -d [:digit:])
	do
		if [[ $PALABRA =~ $REGEX ]]; then
			echo $PALABRA
		fi
	done
	echo "=========================================================="

}

findNames $1

exit 0

