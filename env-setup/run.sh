#!/bin/bash

set -eu

VERSION=${1:-""}

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
