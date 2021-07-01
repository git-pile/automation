#!/bin/bash

set -eu

VERSION=${1:-""}

# TODO: accept VERSION as @branch, so we fetch the remote by ourselves
# and install git-pile from a specific branch

if [[ $VERSION =~ ^[0-9].* ]]; then
	PKG="git-pile==$VERSION"
elif [[ $VERSION =~ ^[/.].* ]]; then
	PKG="${VERSION}/"
elif [ -n "$VERSION" ]; then
	PKG="git-pile$VERSION"
else
	PKG="git-pile"
fi

echo "::group::Install $PKG"
pip install --force-reinstall wheel
pip install --force-reinstall $PKG
echo "::endgroup::"
