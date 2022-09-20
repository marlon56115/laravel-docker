#!/bin/sh
set -e
composer install
#npm install
#npm run dev
php artisan migrate --seed
chown -R www-data:www-data .
chmod -R 777 .
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- apache2-foreground "$@"
fi
exec "$@"