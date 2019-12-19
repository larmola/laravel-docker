FROM php:7.3-fpm

COPY composer.lock composer.json /var/www/

WORKDIR /var/www

RUN apt-get update && apt-get install -y git curl libmcrypt-dev openssl \
    default-mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick mcrypt-1.0.2 \
    && docker-php-ext-enable imagick mcrypt \
    && docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www

RUN composer install

# RUN php artisan cache:clear && php artisan optimize
