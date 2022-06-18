FROM debian:buster
# RUN apt install php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml wget
RUN apt update -y
RUN apt install php-fpm php php-mysql wget mariadb-client -y
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz
# RUN mv wordpress/ /var/www/
# RUN sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" /var/www/wordpress/wp-config-sample.php
# RUN sed -i "s/username_here/$WORDPRESS_DB_USER/g" /var/www/wordpress/wp-config-sample.php
# RUN sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
# RUN sed -i "s/localhost/$WORDPRESS_DB_HOST/g" /var/www/wordpress/wp-config-sample.php
RUN mkdir /run/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress
COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
# RUN echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN chown -R  www-data:www-data /var/www/wordpress/
RUN chmod 777 /var/www/wordpress/
# COPY wp-config.php /var/www/wordpress/wp-config.php
EXPOSE 9000
# RUN echo "<?php phpinfo();?>" >  /var/www/html/index.php
CMD ["sh", "/start.sh"]
# CMD ["php-fpm7.3", "-F"]