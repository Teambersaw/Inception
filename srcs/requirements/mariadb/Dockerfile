FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client  && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /var/run/mysqld && \
	chown -R mysql:root /var/run/mysqld && \
	chmod -R 777 /var/run/mysqld

EXPOSE 3306

COPY init.sh /var/mysql/init.sh

ENTRYPOINT ["/bin/bash", "/var/mysql/init.sh"]
