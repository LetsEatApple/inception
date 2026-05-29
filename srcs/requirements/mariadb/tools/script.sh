#!/bin/bash

DB_PW=$(cat /run/secrets/db_password)
ROOT_PW=$(cat /run/secrets/db_root_password)

cd /etc/mysql

cat <<EOF > init.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PW}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PW}';
FLUSH PRIVILEGES;
EOF

exec mariadbd




