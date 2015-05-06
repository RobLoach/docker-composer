# Composer Docker Container

[Docker](http://docker.com) container to install and run [Composer](http://getcomposer.org).

## Features

* [Composer](http://getcomposer.org)
  * Latest snapshot: `master`
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
    $ docker pull composer/composer:1.0.0-alpha10
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
    $ docker run -v $(pwd):/app composer/composer install
    ```
  Or run using a specific version of Composer:
    ``` sh
    $ docker run -v $(pwd):/app composer/composer:1.0.0-alpha10 install
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

3. Build the container, using Composer's latest `master` release:

    ``` sh
    $ docker build -t composer/composer master
    ```

4. Test running Composer through the container:

    ``` sh
    $ docker run composer/composer help
    ```
