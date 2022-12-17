#!/usr/bin/env bash


function blankLinesCounter {	
	echo "======================================================================"
	awk 'BEGIN { x=0 } /^$/ { x=x+1 } END { print "La cantidad de líneas en blanco es:", x }' $1
	echo "======================================================================"	
}

blankLinesCounter $1

exit 0


