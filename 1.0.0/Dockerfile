# Composer Docker Container
FROM composer/composer:base
MAINTAINER Rob Loach <robloach@gmail.com>

ENV COMPOSER_VERSION 1.0.0
ENV COMPOSER_INSTALLER_SHA384 "7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959"
ENV COMPOSER_ALLOW_SUPERUSER 1

# Install Composer.
RUN php -r "readfile('https://getcomposer.org/installer');" > /tmp/composer-setup.php \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) === '${COMPOSER_INSTALLER_SHA384}') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/tmp/composer-setup.php'); } echo PHP_EOL;" \
  && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} \
  && php -r "unlink('/tmp/composer-setup.php');"

# Display version information.
RUN composer --version
