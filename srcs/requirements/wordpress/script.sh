#!/bin/sh
cd /var/www/html

until mariadb-admin ping -h mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent 2>/dev/null; do
    sleep 1
done

if [ ! -f wp-cli.phar ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

if [ ! -f wp-config.php ]; then
    php84 -d memory_limit=-1 wp-cli.phar core download --allow-root

    php84 -d memory_limit=-1 wp-cli.phar config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb \
        --allow-root
fi

if ! php84 -d memory_limit=-1 wp-cli.phar core is-installed --allow-root 2>/dev/null; then
    php84 -d memory_limit=-1 wp-cli.phar core install \
        --url=$DOMAIN_NAME \
        --title=inception \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --allow-root

    php84 -d memory_limit=-1 wp-cli.phar user create \
        $WP_USER $WP_USER_EMAIL \
        --role=author \
        --user_pass=$WP_USER_PASSWORD \
        --allow-root
fi

exec php-fpm84 -F
