if ! [ -f "/var/www/wordpress/wp-config.php" ]; then
	wp core download --allow-root --force --path=/var/www/wordpress
	while  [ ! -f /var/www/wordpress/wp-config.php ]; do
		sleep 1;
		wp core config --allow-root --dbhost=$WORDPRESS_DB_HOST:3306 --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbname=$WORDPRESS_DB_NAME --path=/var/www/wordpress
	done
	sleep 2;
	echo "---------------------INSTALL WORDPRESS---------------------"
	wp core install --allow-root --url=sclam.42.fr --title=Inception --admin_user=sclam --admin_password=sclam_pass --admin_email=admin@admin.com --path=/var/www/wordpress
	echo "---------------------DUMMY USER---------------------"
	wp user create dummy dummy@dummy.com --user_pass=dummy_pass --role=subscriber --allow-root --path=/var/www/wordpress
	echo "---------------------DONE---------------------"
	echo "define('FS_METHOD','direct');" >> /var/www/wordpress/wp-config.php
	chmod -R 777 /var/www/wordpress/*
fi
php-fpm7.3 -F