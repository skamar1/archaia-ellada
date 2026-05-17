#!/bin/bash
set -e
curl -sLo hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.161.1/hugo_extended_0.161.1_linux-amd64.tar.gz
tar -xzf hugo.tar.gz hugo
./hugo --minify
