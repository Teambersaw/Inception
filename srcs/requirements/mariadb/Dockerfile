FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod -R 777 /var/run/mysqld

EXPOSE 3306

COPY init.sh .
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["sh", "init.sh"]
