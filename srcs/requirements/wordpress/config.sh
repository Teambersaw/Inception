#!/bin/sh

# LOCK_FILE="wp-config.php"

# if [ ! -f "$LOCK_FILE" ];
# then
wp config create --allow-root --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MYSQL_PASSWORD
wp core install	--allow-root --url=$DOMAIN_NAME --title='Inception' --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWD --admin_email='jrossett@student.42.fr' --skip-email
# wp create $WP_BASIC_USER "$WP_BASIC_MAIL" --user_pass="$WP_BASIC_PAS
# fi

/usr/sbin/php-fpm7.3 -F --allow-to-run-as-root