FROM debian:buster

RUN apt-get update && apt-get install -y \
	nginx

COPY index.html /var/www/html/

EXPOSE 443 9000

CMD ["nginx", "-g", "daemon off;"]