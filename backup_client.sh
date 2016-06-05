#!/bin/bash

source ftp_backup.sh
source db_backup.sh

#params: $1-ftp_address, $2-ftp_user, $3-ftp_password, $4-db_address, $5-db_name, $6-db_user, $7-db_password
function backup_client() {
	#copy latest backup as initial situation for current backup
	cd $archieve_dir/$client_name
	latest_backup=`ls $archieve_dir/$client_name | tail -1`
	cp -ar $latest_backup $archieve_dir/$client_name/backup_$date
	
	cd backup_$date
	rm database.sql

	#do backing up
	ftp_backup $1 $2 $3
	db_backup $4 $5 $6 $7
	echo "Client completed." >> $log
	
	cd $archieve_dir
}



