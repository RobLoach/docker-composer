# Composer Docker Container
FROM composer/composer:base-alpine
MAINTAINER Rob Loach <robloach@gmail.com>

ENV COMPOSER_VERSION 1.2.0

# Install Composer
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && rm -rf /tmp/composer-setup.php

# Display version information.
RUN composer --version
