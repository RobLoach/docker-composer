build:
	docker build -t composer/composer:master master
	docker build -t composer/composer:1.0.0-alpha8 1.0.0-alpha8

version:
	docker run composer/composer:master --version
	docker run composer/composer:1.0.0-alpha8 --version

.PHONY: build
