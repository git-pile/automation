#!/bin/bash

set -eu

PILE_BRANCH=$1
PILE_REF=$2
RESULT_BRANCH=$3
FETCH_BASELINE=$4

. config
git pile destroy || true
git pile init -p $PILE_BRANCH -b $BASELINE -r $RESULT_BRANCH
git -C patches reset --hard $PILE_REF

[ "$FETCH_BASELINE" == "true" ] && git fetch -f origin $BASELINE
git branch -f $RESULT_BRANCH $BASELINE

git pile genbranch -i
git log
