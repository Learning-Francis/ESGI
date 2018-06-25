FROM php:7.0-apache

RUN a2enmod rewrite
RUN docker-php-ext-install pdo_mysql
RUN apt-get update 
RUN apt-get install -y libfreetype6-dev \ libjpeg62-turbo-dev \ libpng12-dev && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \ && docker-php-ext-install -j$(nproc) gd

ENV APACHE_LOG_DIR /var/log/apache2

COPY apache.conf /etc/apache2/sites-enabled/000-default.conf
