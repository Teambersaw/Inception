#!/bin/sh

LOCK_FILE="/var/lib/mysql/.lock"

if [ ! -f "$LOCK_FILE" ];
then
mysql_install_db
/etc/init.d/mysql start
mysql_secure_installation << EOF
Y
${MARIADB_ROOT_PWD}
${MARIADB_ROOT_PWD}
Y
Y
Y
Y
EOF
mariadb -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE}";
mariadb -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PWD}'";
mariadb -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION";
mariadb -e "FLUSH PRIVILEGES";
touch "$LOCK_FILE"
/etc/init.d/mysql stop
fi

exec mysqld_safe
