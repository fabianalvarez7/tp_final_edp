#!/bin/bash

function findNames {
	cat $1
	echo "=========================================================="
	REGEX="^[A-Z][a-z]+$"

	for PALABRA in $(cat $1 | tr -d [:punct:] | tr -d [:digit:])
	do
		if [[ $PALABRA =~ $REGEX ]]; then
			echo $PALABRA
		fi
	done
}

findNames $1

exit 0

