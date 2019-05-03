#!/bin/bash
composer install -d /home/app/src
php /home/app/src/artisan serve
