#!/bin/bash
 
################################################################
##
##   MySQL Database Backup Script 
##   Written By: Rahul Kumar
##   URL: https://tecadmin.net/bash-script-mysql-database-backup/
##   Last Update: Jan 05, 2019
##
################################################################
 
echo "Inicio de Backup"

export PATH=/bin:/usr/bin:/usr/local/bin:/opt/lampp/bin/
TODAY=`date +"%d%b%Y"`
 
################################################################
################## Update below values  ########################
 
DB_BACKUP_PATH=$(pwd)'/backup' ## '/backup/dbbackup'
MYSQL_HOST='108.179.252.33'
MYSQL_PORT='3306'
MYSQL_USER='thebik41_tales'
MYSQL_PASSWORD='spider'
DATABASE_NAME='thebik41_db_strava'
BACKUP_RETAIN_DAYS=30   ## Number of days to keep local backup copy
 
#################################################################
 
mkdir -p ${DB_BACKUP_PATH}/${TODAY}
echo "Gravando os dados do banco - ${DATABASE_NAME}"
 
 
mysqldump -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   ${DATABASE_NAME} | gzip > ${DB_BACKUP_PATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz
 
if [ $? -eq 0 ]; then
  echo "Backup realozado com sucesso!"
else
  echo "Error found during backup"
  exit 1
fi
 
 
##### Remove backups older than {BACKUP_RETAIN_DAYS} days  #####
 
DBDELDATE=`date +"%d%b%Y" --date="${BACKUP_RETAIN_DAYS} days ago"`
 
if [ ! -z ${DB_BACKUP_PATH} ]; then
      cd ${DB_BACKUP_PATH}
      if [ ! -z ${DBDELDATE} ] && [ -d ${DBDELDATE} ]; then
            rm -rf ${DBDELDATE}
      fi
fi
 
### End of script ####