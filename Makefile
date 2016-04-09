build:
	docker build -t composer/composer:base base
	docker build -t composer/composer 1.0.0
	docker build -t composer/composer:latest 1.0.0
	docker build -t composer/composer:master master
	docker build -t composer/composer:1.0.0 1.0.0
	docker build -t composer/composer:1.0.0-beta2 1.0.0-beta2
	docker build -t composer/composer:1.0.0-beta1 1.0.0-beta1
	docker build -t composer/composer:1.0.0-alpha11 1.0.0-alpha11
	docker build -t composer/composer:1.0.0-alpha10 1.0.0-alpha10
	docker build -t composer/composer:1.0.0-alpha9 1.0.0-alpha9
	docker build -t composer/composer:1.0.0-alpha8 1.0.0-alpha8

version:
	docker run composer/composer --version
	docker run composer/composer:latest --version
	docker run composer/composer:master --version
	docker run composer/composer:1.0.0 --version
	docker run composer/composer:1.0.0-beta2 --version
	docker run composer/composer:1.0.0-beta1 --version
	docker run composer/composer:1.0.0-alpha11 --version
	docker run composer/composer:1.0.0-alpha10 --version
	docker run composer/composer:1.0.0-alpha9 --version
	docker run composer/composer:1.0.0-alpha8 --version

test:
	docker run composer/composer diagnose
	docker run composer/composer:latest diagnose
	docker run composer/composer:master diagnose
	docker run composer/composer:1.0.0 diagnose
	docker run composer/composer:1.0.0-beta2 --version
	docker run composer/composer:1.0.0-beta1 --version
	docker run composer/composer:1.0.0-alpha11 --version
	docker run composer/composer:1.0.0-alpha10 --version
	docker run composer/composer:1.0.0-alpha9 --version
	docker run composer/composer:1.0.0-alpha8 --version
