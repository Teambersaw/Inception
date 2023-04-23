FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
	php7.3 \
	php-fpm \
	php-mysql && \
	wget https://fr.wordpress.org/wordpress-6.1-fr_FR.tar.gz -P /var/www && \
	cd /var/www && tar -xzf wordpress-6.1-fr_FR.tar.gz && \
	rm wordpress-6.1-fr_FR.tar.gz && \
	chown -R root:root /var/www/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]

