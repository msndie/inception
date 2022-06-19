# if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
# 	mysql_install_db --user=root --datadir=/var/lib/mysql
# 	service mysql start
# 	# echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
# 	echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
# 	echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql
# 	# echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
# 	echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '${MYSQL_USER}'@'%';" | mysql
# 	# echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '${MYSQL_USER}'@'localhost';" | mysql
# 	# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_RANDOM_ROOT_PASSWORD}';" | mysql
# 	echo "FLUSH PRIVILEGES;" | mysql
# 	service mysql stop
# fi
# exec mysqld_safe

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	mysql_install_db --user=root --datadir=/var/lib/mysql
	service mysql start
	# echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
	echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
	mysqladmin create $MYSQL_DATABASE
	# echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql
	# echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql

	# echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '${MYSQL_USER}'@'%';" | mysql
	echo "GRANT ALL PRIVILEGES ON '{$MYSQL_DATABASE}'.* TO '${MYSQL_USER}'@'%';" | mysql

	# echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '${MYSQL_USER}'@'localhost';" | mysql
	# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_RANDOM_ROOT_PASSWORD}';" | mysql
	echo "FLUSH PRIVILEGES;" | mysql
	service mysql stop
	mysqladmin -u root password $MYSQL_RANDOM_ROOT_PASSWORD
fi
exec mysqld_safe