# Composer Docker Container
FROM composer/composer:base
MAINTAINER Rob Loach <robloach@gmail.com>

ENV COMPOSER_VERSION master

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer global require "pyrech/composer-changelogs"

# Display version information
RUN composer --version
