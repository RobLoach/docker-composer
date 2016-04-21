build:
	docker build -t composer/composer:base-php5 base
	docker build -t composer/composer:php5 1.0.0
	docker build -t composer/composer:1-php5 1.0.0
	docker build -t composer/composer:1.0-php5 1.0.0
	docker build -t composer/composer:1.0.0-php5 1.0.0
	docker build -t composer/composer:latest-php5 1.0.0
	docker build -t composer/composer:master-php5 master
	docker build -t composer/composer:1.0.0-beta2-php5 1.0.0-beta2
	docker build -t composer/composer:1.0.0-beta1-php5 1.0.0-beta1
	docker build -t composer/composer:1.0.0-alpha11-php5 1.0.0-alpha11
	docker build -t composer/composer:1.0.0-alpha10-php5 1.0.0-alpha10
	docker build -t composer/composer:1.0.0-alpha9-php5 1.0.0-alpha9
	docker build -t composer/composer:1.0.0-alpha8-php5 1.0.0-alpha8

version:
	@echo -n "composer/composer\t\t"
	@docker run composer/composer:php5 --version --no-ansi
	@echo -n "composer/composer:latest\t"
	@docker run composer/composer:latest-php5 --version --no-ansi
	@echo -n "composer/composer:master\t"
	@docker run composer/composer:master-php5 --version --no-ansi
	@echo -n "composer/composer:1.0.0\t\t"
	@docker run composer/composer:1.0.0-php5 --version --no-ansi
	@echo -n "composer/composer:1.0.0-beta2\t"
	@docker run composer/composer:1.0.0-beta2-php5 --version --no-ansi
	@echo -n "composer/composer:1.0.0-beta1\t"
	@docker run composer/composer:1.0.0-beta1-php5 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha11\t"
	@docker run composer/composer:1.0.0-alpha11-php5 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha10\t"
	@docker run composer/composer:1.0.0-alpha10-php5 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha9\t"
	@docker run composer/composer:1.0.0-alpha9-php5 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha8\t"
	@docker run composer/composer:1.0.0-alpha8-php5 --version --no-ansi

test:
	@make version
