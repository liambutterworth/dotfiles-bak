#!/bin/bash
composer install -d /var/www
php /var/www/artisan serve --host=0.0.0.0 --port=8000
