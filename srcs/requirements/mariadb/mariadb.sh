#!/bin/bash

/etc/init.d/mysql start
echo -e "\ny\ny\n${DB_ROOT_PWD}\n${DB_ROOT_PWD}\ny\ny\ny\ny" | ./usr/bin/mysql_secure_installation
mariadb -e "CREATE DATABASE wordpress";
mariadb -e "CREATE USER '${LOGIN}'@'%' IDENTIFIED BY '${DB_USER_PWD}'";
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${LOGIN}'@'%' IDENTIFIED BY '${DB_USER_PWD}'";
mariadb -e "SHOW GRANTS FOR '${LOGIN}'@'%'";
mariadb -e "SHOW DATABASES";
mariadb -e "SELECT User FROM mysql.user";
mysqld