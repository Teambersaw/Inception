FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
	php7.3 \
	php7.3-fpm \
	mariadb-client \
	php7.3-mysql && \
	mkdir -p /run/php && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY config.sh .
COPY default.conf /etc/php/7.3/fpm/pool.d/
# COPY wp-config.php /var/www/html/wordpress

CMD ["bash", "./config.sh"]
