Composer Docker Container
=========================

[Docker](http://docker.com) container to install and run [Composer](http://getcomposer.org).

Features
--------

* [Composer](http://getcomposer.org) [1.0.0-alpha8](https://github.com/composer/composer/blob/1.0.0-alpha8/CHANGELOG.md)
* [PHP](http://php.net) [5.6.2](http://php.net/ChangeLog-5.php#5.6.2)

Installation / Usage
--------------------

1. Install the `composer/composer` container:

    ``` sh
    $ docker pull composer/composer
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

Installation from Source
------------------------

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

3. Build the container:

    ``` sh
    $ docker build -t composer/composer .
    ```

4. Test running the container:

    ``` sh
    $ docker run composer/composer help
    ```
