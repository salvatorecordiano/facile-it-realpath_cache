FROM ubuntu:16.04

MAINTAINER Salvatore Cordiano <docker@parallel.it>
LABEL maintainer="Salvatore Cordiano <docker@parallel.it>" \
      org.label-schema.docker.dockerfile="Docker/Dockerfile" \
      org.label-schema.name="Ubuntu 16.04 + Apache 2.4 + PHP 7.0 using FPM/FastCGI" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.url="https://www.salvatorecordiano.it" \
      org.label-schema.vcs-url="https://github.com/salvatorecordiano/facile-it-realpath_cache.git"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
RUN /usr/sbin/update-locale

RUN apt-get install -y \
	vim \
	curl \
	supervisor \
	php7.0 \
	php7.0-opcache \
	apache2 \
	libapache2-mod-fastcgi

COPY resources/php7.0-fpm.conf /etc/apache2/conf-available/php7.0-fpm.conf
COPY resources/mpm_event.conf /etc/apache2/mods-available/mpm_event.conf

RUN a2enconf php7.0-fpm && \
	a2dismod mpm_prefork mpm_worker && \
	a2enmod mpm_event fastcgi actions

RUN apt-get autoremove && apt-get clean

RUN mkdir -p /var/lock/apache2 /var/run/apache2 /run/php

COPY resources/releases /var/www/html
RUN ln -sf /var/www/html/release1 /var/www/current
RUN chown -R www-data:www-data /var/www

COPY script /home
RUN chmod +x /home/release-switch.sh /home/release-watch.sh

COPY resources/vhost.conf /etc/apache2/sites-available/000-default.conf

COPY resources/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

WORKDIR /home

EXPOSE 80
