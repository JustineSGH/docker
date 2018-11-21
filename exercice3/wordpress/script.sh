#!/bin/bash
set -e

if [ "$#" -eq 0 ]; then
       if [ ! -f environmentVariable ];
       then
               echo "aucune variable"
       fi
else
       export $1
       export $2
       export $3
       export $4

       echo "variable DB_HOST:" $DB_HOST
       echo "variable DB_USER:" $DB_USER
       echo "variable DB_PASSWORD:" $DB_PASSWORD
       echo "variable DB_NAME:" $DB_NAME

       echo "DB_HOST=$DB_HOST" >> environmentVariable
       echo "DB_USER=$DB_USER" >> environmentVariable
       echo "DB_PASSWORD=$DB_PASSWORD" >> environmentVariable
       echo "DB_NAME=$DB_NAME" >> environmentVariable
fi

wpConfig=/var/www/html/wp-config-sample.php
sed -i -e "s/database_name_here/$DB_NAME/g" $wpConfig
sed -i -e "s/username_here/$DB_USER/g" $wpConfig
sed -i -e "s/password_here/$DB_PASSWORD/g" $wpConfig
sed -i -e "s/localhost/$DB_HOST/g" $wpConfig


cat /var/www/html/wp-config-sample.php
exec /usr/sbin/sshd -D
