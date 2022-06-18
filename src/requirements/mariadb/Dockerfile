FROM debian:buster

RUN apt update -y
RUN apt install mariadb-server -y

RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY start.sh /start.sh
# RUN chmod +x /start.sh
# RUN openrc
# RUN openrc update
# RUN openrc default
# RUN mysql_install_db --user=root --datadir=/var/lib/mysql
# RUN /etc/init.d/mariadb setup
EXPOSE 3306
ENTRYPOINT ["sh", "/start.sh"]