FROM alpine
RUN apk add --no-cache openssl nginx
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 1024 -nodes \
        -out /etc/nginx/ssl/sclam.42.fr.pem \
        -keyout /etc/nginx/ssl/sclam.42.fr.key \
        -subj "/C=RU/CN=sclam.42.fr/"
RUN rm /etc/nginx/http.d/default.conf
COPY conf/default.conf /etc/nginx/http.d/default.conf
# COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]