build:
	docker build -t composer/composer:base base
	docker build -t composer/composer 1.0.1
	docker build -t composer/composer:1 1.0.1
	docker build -t composer/composer:1.0 1.0.1
	docker build -t composer/composer:1.0.1 1.0.1
	docker build -t composer/composer:latest 1.0.1
	docker build -t composer/composer:1.0.0 1.0.0
	docker build -t composer/composer:master master
	docker build -t composer/composer:1.0.0-beta2 1.0.0-beta2
	docker build -t composer/composer:1.0.0-beta1 1.0.0-beta1
	docker build -t composer/composer:1.0.0-alpha11 1.0.0-alpha11
	docker build -t composer/composer:1.0.0-alpha10 1.0.0-alpha10
	docker build -t composer/composer:1.0.0-alpha9 1.0.0-alpha9
	docker build -t composer/composer:1.0.0-alpha8 1.0.0-alpha8

version:
	@echo -n "composer/composer\t\t"
	@docker run composer/composer --version --no-ansi
	@echo -n "composer/composer:latest\t"
	@docker run composer/composer:latest --version --no-ansi
	@echo -n "composer/composer:master\t"
	@docker run composer/composer:master --version --no-ansi
	@echo -n "composer/composer:1.0.1\t\t"
	@docker run composer/composer:1.0.1 --version --no-ansi
	@echo -n "composer/composer:1.0.0\t\t"
	@docker run composer/composer:1.0.0 --version --no-ansi
	@echo -n "composer/composer:1.0.0-beta2\t"
	@docker run composer/composer:1.0.0-beta2 --version --no-ansi
	@echo -n "composer/composer:1.0.0-beta1\t"
	@docker run composer/composer:1.0.0-beta1 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha11\t"
	@docker run composer/composer:1.0.0-alpha11 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha10\t"
	@docker run composer/composer:1.0.0-alpha10 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha9\t"
	@docker run composer/composer:1.0.0-alpha9 --version --no-ansi
	@echo -n "composer/composer:1.0.0-alpha8\t"
	@docker run composer/composer:1.0.0-alpha8 --version --no-ansi

test:
	@make version
