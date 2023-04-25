#!/bin/sh

LOCK_FILE="/var/lib/mysql/.lock"

if [ ! -f "$LOCK_FILE" ];
then
    service mysql start
    mariadb -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE}";
    mariadb -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PWD}'";
    mariadb -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION";
    mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}'";
    mariadb -e "FLUSH PRIVILEGES";
    mariadb -e "SHOW DATABASES";
    mariadb -e "SHOW GRANTS FOR '${MARIADB_USER}'@'%'";
    mariadb -e "SELECT User FROM mysql.user";
    touch "$LOCK_FILE"
fi

exec mysqld