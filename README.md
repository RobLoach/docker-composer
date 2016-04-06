# Composer Docker Container

[Docker](http://docker.com) container to install and run [Composer](http://getcomposer.org).

## Features

* [Composer](http://getcomposer.org)
  * Latest snapshot: `master`
  * [`1.0.0`](https://github.com/composer/composer/blob/1.0.0/CHANGELOG.md)
  * [`1.0.0-beta2`](https://github.com/composer/composer/blob/1.0.0-beta2/CHANGELOG.md)
  * [`1.0.0-beta1`](https://github.com/composer/composer/blob/1.0.0-beta1/CHANGELOG.md)
  * [`1.0.0-alpha11`](https://github.com/composer/composer/blob/1.0.0-alpha11/CHANGELOG.md)
  * [`1.0.0-alpha10`](https://github.com/composer/composer/blob/1.0.0-alpha10/CHANGELOG.md)
  * [`1.0.0-alpha9`](https://github.com/composer/composer/blob/1.0.0-alpha9/CHANGELOG.md)
  * [`1.0.0-alpha8`](https://github.com/composer/composer/blob/1.0.0-alpha8/CHANGELOG.md)
* [PHP](http://php.net) [5.6](http://php.net/ChangeLog-5.php)

## Installation / Usage

1. Install the `composer/composer` container:

    ``` sh
    $ docker pull composer/composer
    ```

  Alternatively, pull a specific version of `composer/composer`:
    ``` sh
    $ docker pull composer/composer:1.0.0
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
    $ docker run --rm -v $(pwd):/app composer/composer:1.0.0 install
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

## Installation from Source

To run, test and develop the Composer Dockerfile itself, you must use the
source directly:

1. Download the source:

    ``` sh
    $ git clone https://github.com/RobLoach/composer-docker.git
    ```

2. Switch to the `composer-docker` directory:

    ``` sh
    $ cd composer-docker
    ```

3. Build the base container (in case of adaptions on the composer base image only)

    ``` sh
    $ docker build -t composer/composer:base base
    ```

4. Build the container, using Composer's latest `master` release:

    ``` sh
    $ docker build -t composer/composer:latest master
    ```

5. Test running Composer through the container:

    ``` sh
    $ docker run composer/composer help
    ```
