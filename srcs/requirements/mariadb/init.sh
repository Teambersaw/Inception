#!/bin/sh

LOCK_FILE="/var/lib/mysql/lock_file"
if [ ! -f "$LOCK_FILE" ];
then
mysql_install_db
sleep 2
service mysql start
sleep 2
mysql -u root --password="" <<EOF
CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PWD}';
GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}';
FLUSH PRIVILEGES;
EOF
mysqladmin -u root --password="${MARIADB_ROOT_PWD}" shutdown
sleep 2
touch "$LOCK_FILE"
fi

exec mysqld_safe