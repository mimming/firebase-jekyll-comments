#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd DIR
rsync -vaz ./_includes/* ./demo/_includes
pushd demo
jekyll build
popd
firebase deploy
popd
