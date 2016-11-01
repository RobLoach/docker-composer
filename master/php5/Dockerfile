# Composer Docker Container
FROM composer/composer:base-php5
MAINTAINER Rob Loach <robloach@gmail.com>

ENV COMPOSER_VERSION master

# Install Composer
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot && rm -rf /tmp/composer-setup.php

RUN git config --global user.email "docker.composer@example.com" \
        && git config --global user.name "Docker Composer"

# Display version information
RUN composer --version
