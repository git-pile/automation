#!/bin/bash

set -eu

PILE_BRANCH=$1
PILE_REF=$2
RESULT_BRANCH=$3
FETCH_BASELINE=$4

. config
if [ "$FETCH_BASELINE" == "true" ]; then
	echo "::group::Fetch baseline"
	git fetch -f origin $BASELINE
	echo "::endgroup::"
fi

echo "::group::Checkout pile/result branch"
git pile destroy 2>/dev/null || true
git pile init -p $PILE_BRANCH -b $BASELINE -r $RESULT_BRANCH
git -C patches reset --hard $PILE_REF
echo "::endgroup::"

git branch -f $RESULT_BRANCH $BASELINE 2>/dev/null

echo "::group::genbranch"
git pile genbranch -i
echo "::endgroup::"

git log --pretty=oneline --abbrev-commit
