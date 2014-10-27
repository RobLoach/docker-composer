# Composer Docker Container
FROM php:5.6.2-cli
MAINTAINER Rob Loach <robloach@gmail.com>

# PHP Extension: Zip
RUN pecl install zip
RUN echo "extension=zip.so" >> /usr/local/lib/php.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Display Composer version information
RUN composer --version

# Set up the application directory.
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
