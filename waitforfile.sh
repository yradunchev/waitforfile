#!/bin/bash

#config

WTCHD="./test" #Path to watch

#get content of the directory in an array
CNTNT=($(shopt -s nullglob;echo ${WTCHD}/*))

#check if there is something in the direcory
[[ ${#CNTNT[@]} -gt 0 ]] || exit # directory is empty, bye!

echo "There is a ${#CNTNT[@]} items in ${WTCHD}"

for i in "${CNTNT[@]}"
do
	[[ -d ${i} ]] && continue #we don't do directories, bye!

	echo "do something with that file: ${i}"

done
