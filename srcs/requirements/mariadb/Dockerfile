FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client 
	#&& \ 
	# mkdir -p /var/run/mysqld && \
	# chown -R mysql:mysql /var/run/mysqld && \
	# chmod -R 777 /var/run/mysqld

EXPOSE 3306

COPY mariadb.sh /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/bin/bash", "mariadb.sh"]
