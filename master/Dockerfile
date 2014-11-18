# Composer Docker Container
FROM php:5.6-cli
MAINTAINER Rob Loach <robloach@gmail.com>

# Dependencies
RUN apt-get install -y php5-curl php5-gd php5-json php5-mcrypt php5-mysql php5-pgsql php5-readline php5-sqlite sqlite3 mysql-client php5-mysql
RUN pecl install zip
RUN echo "extension=zip.so" >> /usr/local/lib/php.ini

# Set environmental variables
ENV COMPOSER_HOME /root/composer

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
