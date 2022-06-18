if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
mysql_install_db --user=root --datadir=/var/lib/mysql
service mysql start
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql
echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '${MYSQL_USER}'@'%';" | mysql
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '${MYSQL_USER}'@'localhost';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_RANDOM_ROOT_PASSWORD}';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
service mysql stop
fi
/usr/bin/mysqld_safe
# cat << EOF > $tfile
# USE mysql;
# FLUSH PRIVILEGES;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_RANDOM_ROOT_PASSWORD" WITH GRANT OPTION;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '';
# EOF

# echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile
# echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile
# mysqld --user=root --bootstrap --verbose=0 < $tfile
# rm -f $tfile
# mysqld --user=root --console