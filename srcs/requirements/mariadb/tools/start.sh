if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	echo "---------------------INSTALL---------------------"
	mysql_install_db
	echo "---------------------START---------------------"
	service mysql start
	echo "---------------------CREATE DB---------------------"
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;"
	echo "---------------------CREATE USER---------------------"
	mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	echo "---------------------GRANT PRIVILEGES---------------------"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
	echo "---------------------FLUSH---------------------"
	mysql -u root -e "FLUSH PRIVILEGES;"
	echo "---------------------CHANGE PASS---------------------"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	echo "---------------------DONE---------------------"
	exit
fi
exec mysqld_safe