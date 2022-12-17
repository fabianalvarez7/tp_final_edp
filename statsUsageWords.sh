#!/usr/bin/env bash


function statsUsageWords {
	echo "================================================================"
	echo "Las 10 palabras que más aparecen en el texto son:"
	cat $1 | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr -d '¿' | tr -d '¡' | tr -d '[:digit:]' | tr '[:space:]' '\n' | awk 'length($0) > 3 {print $0}' | sort | uniq -c | sort -g -r | head 
	echo "================================================================"
}

statsUsageWords $1

exit 0
