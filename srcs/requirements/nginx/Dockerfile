FROM debian:buster

RUN apt update -y
RUN apt install openssl nginx -y

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 1024 -nodes \
        -out /etc/nginx/ssl/sclam.42.fr.pem \
        -keyout /etc/nginx/ssl/sclam.42.fr.key \
        -subj "/C=RU/CN=sclam.42.fr/"

RUN rm /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/www/

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443 
CMD ["nginx", "-g", "daemon off;"]