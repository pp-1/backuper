#!/bin/bash

source config.sh
source backup_client.sh

#start backup for every client
date=`date +%Y-%m-%d`
touch $logs_dir/log_$date.txt
log="$logs_dir/log_$date.txt"

for client in $clients_dir/*.sh
do
  basename="${client##*/}"	
  echo "Backing up $basename" >> $log
  source $client
  mkdir -p $archieve_dir/$client_name/backup_1970-01-01
  backup_client $ftp_address $ftp_user $ftp_password $db_address $db_name $db_user $db_password
  find $archieve_dir/$client_name -mindepth 1 -maxdepth 1 -type d -ctime +$backup_max_age | xargs rm -rf
done

echo "=====Everything's done.====="  >> $log
mail -s 'Backup' $admin_email < $log
