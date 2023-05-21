#!/bin/sh

# LOCK_FILE="wp-config.php"

# if [ ! -f "$LOCK_FILE" ];
# then
sleep 10
cd /var/www/html/wordpress
wp core download --locale=fr_FR --allow-root
chown -R www-data:www-data /var/www/html/wordpress
find /var/www/html/wordpress -type f -exec chmod 644 {} \;
find /var/www/html/wordpress -type d -exec chmod 755 {} \;
# wp config create --dbname=wp --dbuser=wp --dbpass=wp --dbhost=mariadb:3306 --allow-root
wp core install --url=jrossett.42.fr --title=inception --admin_user=wp --admin_password=wp --admin_email=jrossett@student.42.fr --skip-email --allow-root

exec /usr/sbin/php-fpm7.3 -F
# --allow-to-run-as-root