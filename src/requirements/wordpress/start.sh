if ! [ -f "/var/www/wordpress/wp-config.php" ]; then
	wp core download --allow-root --force --path=/var/www/wordpress
	while  [ ! -f /var/www/wordpress/wp-config.php ]; do
		sleep 1;
		wp core config --allow-root --dbhost=$WORDPRESS_DB_HOST:3306 --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbname=$WORDPRESS_DB_NAME --path=/var/www/wordpress
	done
	wp core install --allow-root --url=sclam.42.fr --title=Inception --admin_user=sclam --admin_password=sclam_pass --admin_email=admin@admin.com --skip-email --path=/var/www/wordpress
fi
php-fpm7.3 -F