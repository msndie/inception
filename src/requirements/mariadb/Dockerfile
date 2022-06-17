FROM debian:buster
RUN apt update -y
RUN apt install mariadb-server -y
RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN rm /etc/my.cnf
# COPY my.cnf /etc/my.cnf
COPY start.sh /start.sh
# RUN chmod +x /start.sh
# RUN openrc
# RUN openrc update
# RUN openrc default
# RUN mysql_install_db --user=root --datadir=/var/lib/mysql
# RUN /etc/init.d/mariadb setup
ENTRYPOINT ["sh", "/start.sh"]