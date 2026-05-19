#!/bin/bash

db_password=$(cat $db_password_file)

cd /etc/mysql

cat <<EOF > init.sql
CREATE DATABASE ${db_name};
CREATE USER IF NOT EXISTS '${db_user}'@'%' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

#mariadb-install-db
mysql_install_db
mysqld




