FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-client \
	mariadb-server

EXPOSE 3306

COPY my.cnf /etc/mysql/my.cnf

# ENTRYPOINT ["./mariadb.sh"]

CMD ["bash"]
