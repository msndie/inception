FROM debian:buster

RUN apt update -y
RUN apt install mariadb-server procps -y

RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY start.sh /start.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/start.sh"]