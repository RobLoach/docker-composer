#!/bin/bash
#
# Usage: ./update.sh x.y.z
#
# This script runs to create a Dockerfile for a new Composer version.
# If you specify a partial version, like '1' or '1.0', it will determine the most recent sub version like 1.0.1.
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	echo "Usage: bash update.sh [version ...]"
	exit 1
fi
versions=( "${versions[@]%/}" )

function write_files {
	local full_version=$1
	local variant=$2

	short_version=$(echo $full_version | sed -r -e 's/^([0-9]+.[0-9]+.[0-9]+)/\1/')
	if [[ -z $variant ]]; then
		target_dir="$short_version"
		template=Dockerfile.template
	else
		target_dir="$short_version/$variant"
		template=Dockerfile-$variant.template
	fi

	mkdir -p "$target_dir"
	cp $template "$target_dir/Dockerfile"
	if [[ -f docker-entrypoint.sh ]]; then
		cp -r docker-entrypoint.sh scripts "$target_dir"
	fi
	sed -r -i -e 's/^(ENV COMPOSER_VERSION) .*/\1 '"$full_version"'/' "$target_dir/Dockerfile"
}

tags="$(git ls-remote --tags https://github.com/composer/composer.git | cut -d/ -f3 | cut -d^ -f1 | cut -dv -f2 | sort -rV)"

for version in "${versions[@]}"; do
	full_version="$(echo "$tags" | grep "^$version" | tail -n 1)"
	if [[ -z $full_version ]]; then
		echo "Cannot find version: $version"
		exit 1
	fi
	(
		set -x
		write_files $full_version
		write_files $full_version 'alpine'
	)
done
