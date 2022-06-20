FROM debian:buster

RUN apt update -y
RUN apt install php-fpm php php-mysql php-gd php-mbstring php-xml php-soap php-imap php-xmlrpc php-intl php-zip php-curl php-gmp php-zip wget mariadb-client sendmail -y

RUN mkdir /run/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress

COPY tools/start.sh /start.sh
RUN chmod +x /start.sh

RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R  www-data:www-data /var/www/wordpress/
RUN chmod 777 /var/www/wordpress/

ENTRYPOINT ["sh", "/start.sh"]