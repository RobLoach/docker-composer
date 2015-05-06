build:
	docker build -t composer/composer master
	docker build -t composer/composer:1.0.0-alpha10 1.0.0-alpha10
	docker build -t composer/composer:1.0.0-alpha9 1.0.0-alpha9
	docker build -t composer/composer:1.0.0-alpha8 1.0.0-alpha8

version:
	docker run composer/composer --version
	docker run composer/composer:1.0.0-alpha10 --version
	docker run composer/composer:1.0.0-alpha9 --version
	docker run composer/composer:1.0.0-alpha8 --version

.PHONY: build
