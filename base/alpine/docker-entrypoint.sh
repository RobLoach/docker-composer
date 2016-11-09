#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- composer "$@"
fi

# if our command is a valid composer subcommand, let's invoke it through composer instead
# (this allows for "docker run composer/composer update", etc)
if [ "$1" != "sh" ] && composer "$1" --help > /dev/null 2>&1 ]; then
	set -- composer "$@"
fi

exec "$@"
