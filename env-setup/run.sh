#!/bin/bash

set -eu

VERSION=${1:-""}

echo $VERSION

if [[ $VERSION =~ ^[0-9].* ]]; then
	VERSION="==$VERSION"
fi

echo "::group::Install git-pile$VERSION"
pip install --force-reinstall wheel
pip install --force-reinstall "git-pile$VERSION"
echo "::endgroup::"
