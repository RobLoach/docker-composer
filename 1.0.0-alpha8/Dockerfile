# Composer Docker Container
FROM php:5.6-cli
MAINTAINER Rob Loach <robloach@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y zlib1g zlib1g-dev php5-common git mercurial subversion
RUN apt-get install -y php5-curl php5-gd php5-json php5-mcrypt php5-mysql php5-pgsql php5-readline php5-sqlite sqlite3 mysql-client php5-mysql

# Enable any modules
RUN php5enmod curl json mysql mysqli pdo_mysql pdo_sqlite readline gd mcrypt pdo sqlite3
RUN pecl install zip
RUN echo "extension=zip.so" > /usr/local/etc/php/conf.d/extension-zip.ini

# Set environmental variables
ENV COMPOSER_HOME /root/composer

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.0.0-alpha8

# Display Composer version information
RUN composer --version

# Set up the application directory.
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
