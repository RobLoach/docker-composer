# Composer Docker Container
FROM php:5.6-cli
MAINTAINER Rob Loach <robloach@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Dependencies
RUN apt-get update
RUN apt-get install -y zlib1g-dev git mercurial subversion
RUN docker-php-ext-install zip

# Set memory limit
RUN echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Set environmental variables
ENV COMPOSER_HOME /root/composer

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.0.0-alpha9

# Display version information
RUN php --version
RUN composer --version

# Set up the application directory.
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi", "--ignore-platform-reqs"]
