#!/bin/bash

#config

WTCHD="./test" #Path to watch
DSTDR="./test1" #Destination path

#get conetnt of the directory in an array
CNTNT=($(shopt -s nullglob;echo ${WTCHD}/*))

#check if there is something in the direcory
[[ ${#CNTNT[@]} -gt 0 ]] || exit # directory is empty, bye!
for i in "${CNTNT[@]}"
do
        [[ -d ${i} ]] && continue #we don't do directories, bye!
#construct unique file name
        FLNAM=${i##*/}
        FLEXT=${FLNAM##*.}
        FLPRE=${FLNAM%.*}
        DSTFL=${DSTDR}/$(date +%Y%m%d%H%M%S)_${FLPRE}.${FLEXT}

#move file to destination directory
        mv ${i} ${DSTFL}
done