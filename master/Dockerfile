# Composer Docker Container
FROM debian:jessie
MAINTAINER Rob Loach <robloach@gmail.com>

# Dependencies
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    ca-certificates \
    make \
    php5-cli \
    php5-dev \
    php5-json \
    curl \
    git-core \
    mercurial \
    subversion \
    zlib1g \
    zlib1g-dev \
    php5-common \
    mcrypt \
    php5-curl \
    php5-mcrypt \
    php5-readline \
    php-pear \
    --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN php5enmod curl json readline mcrypt pdo
RUN pecl install zip

# Set timezone and memory limit.
RUN echo "memory_limit=${PHP_MEMORY_LIMIT:-1024M}" > /etc/php5/cli/conf.d/memory-limit.ini
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > /etc/php5/cli/conf.d/date_timezone.ini

# Set environmental variables
ENV COMPOSER_HOME /root/composer

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Display version information
RUN php --version && \
  composer --version

# Set up the application directory.
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
