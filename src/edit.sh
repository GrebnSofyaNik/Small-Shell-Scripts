#!/bin/bash
read -ep 'Enter the absolute path of your file: ' filename
#chmod 777 $filename
#chmod 777 /Users/flatulek/T02D02-0/src/files.log
if [[ -f $filename ]]
then
	read -ep 'What do you want to replase? ' str
	read -ep 'What do you want to replase it whith? ' rep
if grep $str $filename
then
	sed -i '.bak' "s/$str/$rep/g" $filename
	name=$(basename "$filename")
	echo "src/$name - $(stat -l $filename | awk '{print $5}') - $(date +"%Y-%m-%d %H:%M") - $(shasum -a 256 $filename | awk '{print $1}') - sha256" >> "files.log"
else
	echo "Error."i
fi
else 
	echo "NO way."
fi
