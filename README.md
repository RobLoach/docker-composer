# Supported tags and respective `Dockerfile` links

- `1.0.0`
- `1.0.0-alpine`
- `1.0.0-php5-alpine`
- `1.0.1`, `1.0`, `1`
- `1.0.1-alpine`, `1.0-alpine`, `1-alpine`
- `1.0.1-php5-alpine`, `1.0-php5-alpine`, `1-php5-alpine`
- `master`
- `master-alpine`
- `master-php5-alpine`

# What is Composer?

Composer is a tool for dependency management in PHP. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

> [wikipedia.org/wiki/Composer (software)](https://en.wikipedia.org/wiki/Composer_(software))

![Composer Logo](logo.png "Composer")

# How to use this image.

## Installation / Usage

1. Install the `composer/composer` container:

    ``` sh
    $ docker pull composer/composer
    ```

  Alternatively, pull a specific version of `composer/composer`:
    ``` sh
    $ docker pull composer/composer:1.0.1
    ```

2. Create a composer.json defining your dependencies. Note that this example is
a short version for applications that are not meant to be published as packages
themselves. To create libraries/packages please read the
[documentation](http://getcomposer.org/doc/02-libraries.md).

    ``` json
    {
        "require": {
            "monolog/monolog": ">=1.0.0"
        }
    }
    ```

3. Run Composer through the Composer container:

    ``` sh
    $ docker run --rm -v $(pwd):/app composer/composer install
    ```
  Or run using a specific version of Composer:
    ``` sh
    $ docker run --rm -v $(pwd):/app composer/composer:1.0.1 install
    ```
  If working with packages installed via git ssh the local .ssh directory shall be mapped into the container:
    ```sh
    $ docker run --rm -v $(pwd):/app -v ~/.ssh:/root/.ssh composer/composer install
    ```

4. Add optional `composer` command to the host (tested on OS X El Capitan with docker-machine)

  Create new composer file
    ```sh
    $ sudo vim /usr/local/bin/composer
    ```

  The contents of the file will look like this:
    ```sh
    #!/bin/sh
    export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
    echo "Current working directory: '"$(pwd)"'"
    docker run --rm -v $(pwd):/app -v ~/.ssh:/root/.ssh composer/composer $@
    ```

  Once the script has been made, it must be set as executable
    ```sh
    $ sudo chmod +x /usr/local/bin/composer
    ```

  Now the `composer` command is available native on host:
    ```sh
    $ composer --version
    ```

# Image Variants

## `composer/composer:<version>

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of.

## `composer/composer:php5`

This is made to run Composer through PHP 5, rather then the default of PHP 7.

## `composer/composer:alpine`

This image is based on the popular [Alpine Linux project](http://alpinelinux.org/), available in [the alpine official image](https://hub.docker.com/_/alpine). Alpine Linux is much smaller than most distribution base images (~5MB), and thus leads to much slimmer images in general.
