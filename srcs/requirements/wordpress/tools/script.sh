#!/bin/bash

DB_PW=$(cat /run/secrets/db_password)
ADMIN_PW=$(cat /run/secrets/admin_password)
USER_PW=$(cat /run/secrets/wpuser_password)

#echo "Waiting for MariaDB..."
#until mysql -h "mariadb" -u "$DB_USER" -p"$DB_PW" -e "SELECT 1;" >/dev/null 2>&1; do
#  sleep 2
#done

cd /var/www/html

#rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

if [ ! -f index.php ]; then
  ./wp-cli.phar core download --allow-root
fi

if [ ! -f wp-config.php ]; then
  ./wp-cli.phar config create \
    --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_PW \
    --dbhost=mariadb \
    --allow-root
fi

if ! ./wp-cli.phar core is-installed --allow-root; then
  ./wp-cli.phar core install \
    --url=$DOMAIN_NAME \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN \
    --admin_password=$ADMIN_PW \
    --admin_email=$WP_ADMIN_EMAIL \
    --allow-root
fi

if ! ./wp-cli.phar user get "$WP_USER" --allow-root >/dev/null 2>&1; then
  ./wp-cli.phar user create \
    "$WP_USER" \
    "$WP_USER_EMAIL" \
    --user_pass="$USER_PW" \
    --role=author \
    --allow-root
fi

exec php-fpm8.2 -F