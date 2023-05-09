FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
	php7.3 \
	php-fpm \
	php-mysql && \
	wget https://fr.wordpress.org/wordpress-6.1-fr_FR.tar.gz -P /var/www/html/wordpress && \
	cd /var/www/html/wordpress && tar -xzf wordpress-6.1-fr_FR.tar.gz && \
	rm wordpress-6.1-fr_FR.tar.gz && \
	chown -R root:root /var/www/ && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY wp-config.php /var/www/html/wordpress
COPY config.sh .

CMD ["sh", "config.sh"]
