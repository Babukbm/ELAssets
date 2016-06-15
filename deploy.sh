#!/bin/sh
DEST_BRANCH_DEFAULT=master
DEST_BRANCH=${1:-$DEST_BRANCH_DEFAULT}

aws s3 sync "./src" "s3://brick-web/ds/$DEST_BRANCH/assets"
