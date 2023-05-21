FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-server \
	procps && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod -R 777 /var/run/mysqld

EXPOSE 3306

COPY init.sh .
COPY ./my.cnf /etc/mysql/my.cnf

CMD ["bash", "./init.sh"]
