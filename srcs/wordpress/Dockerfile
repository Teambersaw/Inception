FROM debian:buster

RUN apt-get update && apt-get install -y \
	php-mysql \
	php-fpm \
	wget \
	wget twentytwentytwo.1.4.zip

EXPOSE 9000

CMD ["php-fpm"]