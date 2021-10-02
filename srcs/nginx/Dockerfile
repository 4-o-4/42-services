FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    nginx

COPY index.html /var/www/index.html

RUN mkdir -p /run/nginx

EXPOSE 80 

CMD ["nginx", "-g", "daemon off;"]
