#!/bin/bash
echo "Enter the absolute way of your file: "
read way
if [[ -f $way ]]
then
	line=$(wc -l $way | awk ' {print $1} ')
	unique=$(awk ' {print $1} ' $way | sort -u | wc -l)
	hast=$(awk ' {print $8} ' $way | sort -u |  wc -l)
		echo $line $unique $hast
else 
	echo "Error."
fi
