# Composer Docker Container
FROM composer/composer:base
MAINTAINER Rob Loach <robloach@gmail.com>

ENV COMPOSER_VERSION master

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" \
  | php -- --install-dir=/usr/local/bin --filename=composer

# Display version information
RUN ["composer", "--version"]
