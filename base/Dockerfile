# Composer Docker Container
# Base Dockerfile: composer/base
FROM alpine:3.1
MAINTAINER Rob Loach <robloach@gmail.com>

# Packages
RUN apk add --update \
    ca-certificates \
    git \
    mercurial \
    php-bz2 \
    php-cli \
    php-dom \
    php-gd \
    php-json \
    php-mcrypt \
    php-openssl \
    php-pdo \
    php-pear \
    php-phar \
    php-zip \
    subversion \
    unrar \
    && rm -rf /var/cache/apk/*

# Set up the application directory
VOLUME ["/app"]

WORKDIR /app

# Set up the command arguments
ENTRYPOINT ["composer", "--ansi"]
