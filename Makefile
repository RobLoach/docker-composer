build:
	docker build -t composer/composer:base base
	docker build -t composer/composer:base-alpine base/alpine
	docker build -t composer/composer 1.1
	docker build -t composer/composer:1.1 1.1
	docker build -t composer/composer:1.0 1.0
	docker build -t composer/composer:master master
	docker build -t composer/composer:alpine 1.1/alpine
	docker build -t composer/composer:1.1-alpine 1.1/alpine
	docker build -t composer/composer:1.0-alpine 1.0/alpine
	docker build -t composer/composer:master-alpine master/alpine

version:
	@echo -n "composer/composer\t\t"
	@docker run composer/composer --version --no-ansi
	@echo -n "composer/composer:master\t"
	@docker run composer/composer:master --version --no-ansi
	@echo -n "composer/composer:1.0\t\t"
	@docker run composer/composer:1.0 --version --no-ansi
	@echo -n "composer/composer:1.1\t\t"
	@docker run composer/composer:1.1 --version --no-ansi
	@echo -n "composer/composer:alpine\t\t"
	@docker run composer/composer:alpine --version --no-ansi
	@echo -n "composer/composer:master-alpine\t"
	@docker run composer/composer:master-alpine --version --no-ansi
	@echo -n "composer/composer:1.0-alpine\t\t"
	@docker run composer/composer:1.0-alpine --version --no-ansi
	@echo -n "composer/composer:1.1-alpine\t\t"
	@docker run composer/composer:1.1-alpine --version --no-ansi

test:
	@make version
