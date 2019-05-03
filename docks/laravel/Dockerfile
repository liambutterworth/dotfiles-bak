FROM php:7.2

# install dependencies
RUN apt-get update && apt-get install -y git zip unzip dnsutils
RUN docker-php-ext-install pdo_mysql

# install node
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs

# install composer
RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('/tmp/composer-setup.php');"

# create app user
RUN useradd -m app
USER app
WORKDIR /home/app

# copy entrypoint script
COPY docker-command.sh /home/app/docker-command.sh
