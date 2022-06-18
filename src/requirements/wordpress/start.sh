if ! [ -f "/var/www/wordpress/wp-config.php" ]; then
# cd /var/www/wordpress && wp core download --allow-root --force
wp core download --allow-root --force --path=/var/www/wordpress
# mv /wp-config.php ./wp-config.php
wp core config --allow-root --dbhost=$WORDPRESS_DB_HOST:3306 --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbname=$WORDPRESS_DB_NAME --path=/var/www/wordpress
wp core install --allow-root --url=sclam.42.fr --title=Inception --admin_user=sclam --admin_password=sclam --admin_email=admin@admin.com --skip-email --path=/var/www/wordpress
fi
# wp user create --allow-root 
php-fpm7.3 -F
# cd /var/www/wordpress
# if ! wp core is-installed --allow-root; then
# 	wp core download --allow-root
# 	wp config --allow-root --dbname=$WORDPRESS_DB_HOST:3306 --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --force
# 	wp core install --allow-root --url=sclam.42.fr --title=Inception --admin_user=sclam --admin_password=sclam --admin_email="admin@admin.com" --skip-email
# fi
# # wp user create --allow-root 
# php-fpm7.3 -F