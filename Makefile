.PHONY = all build test

all: build test

build: build/1.2 build/master

test: test/1.2 test/master

build/%:
	docker build -t composer/composer:$* $*
	docker build -t composer/composer:$*-alpine $*/alpine
	docker build -t composer/composer:$*-php5 $*/php5
	docker build -t composer/composer:$*-php5-alpine $*/php5/alpine

test/%:
	@echo composer/composer:$*
	@docker run composer/composer:$* --version --no-ansi
	@echo composer/composer:$*-alpine
	@docker run composer/composer:$*-alpine --version --no-ansi
	@echo composer/composer:$*-php5
	@docker run composer/composer:$*-php5 --version --no-ansi
	@echo composer/composer:$*-php5-alpine
	@docker run composer/composer:$*-php5-alpine --version --no-ansi
