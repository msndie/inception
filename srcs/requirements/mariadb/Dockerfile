FROM debian:buster

RUN apt update -y
RUN apt install mariadb-server procps -y

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/start.sh /start.sh

RUN chown -R  www-data:www-data /var/lib/mysql/
RUN chmod 777 /var/lib/mysql/

EXPOSE 3306

ENTRYPOINT ["sh", "/start.sh"]