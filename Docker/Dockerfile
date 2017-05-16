FROM php:7.0-apache
MAINTAINER Salvatore Cordiano <docker@parallel.it>

RUN docker-php-ext-install opcache

COPY resources/vhost.conf /etc/apache2/sites-available/000-default.conf

COPY resources/releases /var/www/html
RUN ln -sf /var/www/html/release1 /var/www/current

COPY script /home
RUN chmod +x /home/release-switch.sh /home/release-watch.sh

WORKDIR /home

EXPOSE 80
