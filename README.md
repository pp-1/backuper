# backuper
Mysqldump and wget are necessary.

Script configuration:

1. put ftp and database data of target website in bash file in clients directory. Number of websites = number of files.
2. change config file according to your configuration (logs path, backup path, administrator email, how long to keep backup files etc.)
3. set up cron to fire backup.sh file

The script will put all of your websites backups in defined client directory, using backup_directory/client_name/backup_YYYY-MM-DD scheme.
The first backup may take a long time, so if you have some previously backed up data you can put it in /backup_directory/client_name/backup_1970-01-01.
The second and next backup is done by:

	1. copy the last backup directory to current backup directory
	2. delete old database backup
	3. download only files that were changed or new files
	4. download new database backup

