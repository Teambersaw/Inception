FROM debian:buster

RUN apt-get update && apt-get install -y \
	nginx \
	openssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=Ile-de-France/L=Paris/O=Global Security/OU=IT Department/CN=jrossett.42.com" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.php /var/www/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]