#!/bin/bash

#  echo "Waiting for DB..."
#until mysqladmin ping -h mariadb --silent; do
#  sleep 2
#done

#until getent hosts mariadb > /dev/null; do
#  echo "Waiting for DNS..."
#  sleep 1
#done

DB_PW=$(cat /run/secrets/db_password)
ADMIN_PW=$(cat /run/secrets/admin_password)
USER_PW=$(cat /run/secrets/wpuser_password)

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root

./wp-cli.phar config create \
--dbname=$DB_NAME \
--dbuser=$DB_USER \
--dbpass=$DB_PW \
--dbhost=mariadb \
--allow-root

./wp-cli.phar core install \
--url=$DOMAIN_NAME \
--title=$WP_TITLE \
--admin_user=$WP_ADMIN \
--admin_password=$ADMIN_PW \
--admin_email=$WP_ADMIN_EMAIL \
--allow-root

./wp-cli.phar user create \
$WP_USER \
$WP_USER_EMAIL \
--user_pass=$USER_PW \
--role=author \
--allow-root

exec php-fpm8.2 -F