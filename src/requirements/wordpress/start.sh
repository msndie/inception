if ! [ -f "/var/www/wordpress/wp-config.php" ]; then
cd /var/www/wordpress && wp core download --allow-root --force
wp config create --allow-root --dbname=$WORDPRESS_DB_HOST:3306 --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --force
wp core install --allow-root --url=sclam.42.fr --admin_user=sclam --admin_password=sclam --path=/var/www/wordpress
fi
# wp user create --allow-root 
php-fpm7.3 -F