# Composer Docker Container
# Base Dockerfile: composer/base
FROM alpine:3.1
MAINTAINER Rob Loach <robloach@gmail.com>

# Packages
RUN ["apk", "--update", "add", "ca-certificates", "git", "mercurial", "php-bz2", "php-gd", "php-json", "php-mcrypt", "php-openssl", "php-pear", "php-phar", "php-zip", "subversion", "unrar"]

# Display PHP info
RUN ["php", "-i"]

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
