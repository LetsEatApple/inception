#!/bin/bash

DB_PW=$(cat /run/secrets/db_password)

cd /etc/mysql

cat <<EOF > init.sql
CREATE DATABASE ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PW}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

exec mariadbd
#mariadb-install-db
#mysql_install_db
#mysqld




