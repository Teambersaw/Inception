FROM alpine:3.16

RUN apk update && apk add --no-cache nginx

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]