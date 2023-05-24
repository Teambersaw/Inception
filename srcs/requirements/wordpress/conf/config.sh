#!/bin/sh

LOCK_FILE="/var/www/html/wordpress/wp-config.php"

if [ ! -f "$LOCK_FILE" ];
then
sleep 10
cd /var/www/html/wordpress
wp core download --allow-root
chown -R www-data:www-data /var/www/html/wordpress
find /var/www/html/wordpress -type f -exec chmod 644 {} \;
find /var/www/html/wordpress -type d -exec chmod 755 {} \;
wp config create --skip-check --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_USER_PWD --dbhost=$DB_HOST --allow-root
wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD_USER --allow-root
fi

exec php-fpm7.3 -RF