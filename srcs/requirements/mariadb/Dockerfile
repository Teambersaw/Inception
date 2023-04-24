FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client

EXPOSE 3306

# COPY ./mariadb.sh /usr/local/bin/mariadb.sh
# RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/bin/bash"]
