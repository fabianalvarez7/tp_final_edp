#!/bin/bash


function findNames {

	REGEX="^[A-Z][a-z]+$"

	for PALABRA in $(cat $1 | tr -d [:punct:] | tr -d [:digit:])
	do
		if [[ $PALABRA =~ $REGEX ]]; then
			echo $PALABRA
		fi
	done
}

findNames textotp.txt

exit 0

