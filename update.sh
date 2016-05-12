#!/bin/bash
#
# Usage: ./update.sh x.y.z
#
# This script runs to create a Dockerfile for a new Composer version.
# If you specify a partial version, like '1' or '1.0', it will determine the most recent sub version like 1.0.1.
set -eo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	echo "Usage: bash update.sh [version ...]"
	exit 1
fi
versions=( "${versions[@]%/}" )

function writeFiles {
	local fullVersion=$1
	local variant=$2

	shortVersion=$(echo $fullVersion | sed -r -e 's/^([0-9]+.[0-9]+).*/\1/')
	if [[ -z $variant ]]; then
		targetDir="$shortVersion"
		template=Dockerfile.template
	else
		targetDir="$shortVersion/$variant"
		template=Dockerfile-$variant.template
	fi

	mkdir -p "$targetDir"
	cp $template "$targetDir/Dockerfile"
	if [[ -f docker-entrypoint.sh ]]; then
		cp -r docker-entrypoint.sh "$targetDir"
	fi
	sed -r -i -e 's/^(ENV COMPOSER_VERSION) .*/\1 '"$fullVersion"'/' "$targetDir/Dockerfile"
}

tags="$(git ls-remote --tags https://github.com/composer/composer.git | cut -d/ -f3 | cut -d^ -f1 | cut -dv -f2 | sort -rV)"

for version in "${versions[@]}"; do
	possibleVersions="$(echo "$tags" | grep "^$version" )"
	if releaseVersions="$(echo "$possibleVersions" | grep -ivEm1 'milestone|-alpha|-beta|-rc')"; then
		fullVersion="$releaseVersions"
	else
		fullVersion="$(echo "$possibleVersions" | head -n1)"
	fi

	if [[ -z $fullVersion ]]; then
		echo "Cannot find version: $version"
		exit 1
	fi

	(
		set -x
		writeFiles $fullVersion
		writeFiles $fullVersion 'alpine'
		writeFiles $fullVersion 'php5'
		writeFiles $fullVersion 'php5-alpine'
	)
done
