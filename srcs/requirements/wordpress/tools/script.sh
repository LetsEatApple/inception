#!/bin/bash

#  echo "Waiting for DB..."
#until mysqladmin ping -h mariadb --silent; do
#  sleep 2
#done

#until getent hosts mariadb > /dev/null; do
#  echo "Waiting for DNS..."
#  sleep 1
#done

db_password=$(cat $db_password_file)
admin_password=$(cat $admin_password_file)
wpuser_password=$(cat $wpuser_password_file)

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root

./wp-cli.phar config create \
--dbname=$db_name \
--dbuser=$db_user \
--dbpass=$db_password \
--dbhost=mariadb \
--allow-root

./wp-cli.phar core install \
--url=$DOMAIN_NAME \
--title=$WP_TITLE \
--admin_user=$WP_ADMIN \
--admin_password=$db_password \
--admin_email=$WP_ADMIN_EMAIL \
--allow-root

./wp-cli.phar user create \
$WP_USER \
$WP_USER_EMAIL \
--user_pass=$db_password \
--role=author \
--allow-root

php-fpm8.2 -F