#!/bin/bash

# Start MariaDB server
/usr/bin/mysqld_safe &

# Wait until MariaDB server is ready
while ! mysqladmin ping --silent; do
    sleep 1
done

# Run mysql_secure_installation to secure the installation
mysql_secure_installation <<EOF

y
admin_password
admin_password
y
y
y
y
EOF

# Create admin user and set password
mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin_password';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;"

# Create user user and set password
mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY 'user_password';"
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'user'@'%' WITH GRANT OPTION;"

# Restart MariaDB server to apply changes
mysqladmin shutdown
/usr/bin/mysqld_safe
