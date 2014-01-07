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


The contents of this e-mail and attachments, if any, are confidential and solely intended for the use of the addressee. If you receive this e-mail in error, then we kindly request you to notify the sender thereof immediately, and to delete the e-mail and the attachments without printing, copying or distributing any of those.

The publication, copying whole or in part or use or dissemination in any other way of the e-mail and attachments by others than the intended person(s) is prohibited.

The sender cannot guarantee the security of electronic communication and is not liable for any negative consequence of the use of electronic communication, including but not limited to, damage as a result of in or non-complete delivery or delay in delivery of any e-mail; the text of the e-mail as sent is decisive.

The sender is part of the TMF Group, consisting of a number of companies worldwide. A full list of the names, addresses and details of the regulatory status of companies is available on the web site: http://www.tmf-group.com.
