FROM php:8.1-fpm

RUN apt-get update && \
    apt-get install -y libzip-dev zip unzip libpng-dev libjpeg-dev zlib1g-dev && \
    # Install ssh
    apt-get install -y openssh-client && \
    # Install composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    # Install php ext
    docker-php-ext-install pdo pdo_mysql zip exif gd

WORKDIR /var/www/html
COPY . /var/www/html

RUN composer install
