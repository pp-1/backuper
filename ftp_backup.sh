#!/bin/bash

function ftp_backup() {
	wget -Nr -np -nH -q --user=$2 --password=$ftp_password $1 
	BACKUP_SIZE=`du -hs .`
	echo "FTP backup size: $BACKUP_SIZE" >> $log
}

