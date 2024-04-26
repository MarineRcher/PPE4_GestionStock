
FROM php:8.3.0-apache

RUN apt update && apt upgrade -y
#Install PDO extensions
RUN docker-php-ext-install pdo pdo_mysql

COPY config/apache2.conf /etc/apache2/apache2.conf
#Enable Apache mod_rewrite
RUN a2enmod rewrite

RUN service apache2 restart

