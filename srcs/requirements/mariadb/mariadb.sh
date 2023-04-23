#!/bin/bash

mysql /bin/bash "mysqld &"

mysql CREATE DATABASE wordpress_database;

mysql "CREATE USER 'king'@'localhost' IDENTIFIED BY 'yes';"
mysql "CREATE USER 'loser'@'localhost' IDENTIFIED BY 'no';"

mysql "GRANT ALL PRIVILEGES ON *.* TO 'king'@'localhost';"