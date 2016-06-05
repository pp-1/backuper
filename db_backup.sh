#!/bin/bash

function db_backup() {
	mysqldump -h $1 -u $3 -p$4 $2 > database.sql
	DB_SIZE=`du -h database.sql`
	echo "DB size: $DB_SIZE." >> $log 
}

