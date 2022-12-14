#!/bin/bash

function statsUsageWords {
	cat $1
	echo "================================================================"
	echo "Las 10 palabras que más aparecen en el texto son:"
	cat $1 | iconv -f UTF-8 -t ASCII//TRANSLIT | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr -d '¿' | tr -d '¡' | tr -d '[:digit:]' | tr '[:space:]' '\n' | awk 'length($0) > 3 {print $0}' | sort | uniq -c | sort -g -r | head 
	echo "================================================================"
}

statsUsageWords $1

exit 0
