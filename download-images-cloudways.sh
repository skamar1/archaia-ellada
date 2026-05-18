#!/bin/bash
set -e
cd "$(dirname "$0")"

CLOUDWAYS="http://wordpress-1462684-5513089.cloudwaysapps.com"

while IFS= read -r url; do
  path="${url#https://archaia-ellada.gr}"
  cloudways_url="${CLOUDWAYS}${path}"
  dest="static${path}"
  dir="static$(dirname "$path")"
  mkdir -p "$dir"
  curl -skL --max-time 20 "$cloudways_url" -o "$dest"
  size=$(wc -c < "$dest" | tr -d ' ')
  if [ "$size" -gt 1000 ]; then
    echo "OK ($size): $path"
  else
    echo "FAIL ($size): $path"
  fi
done < /tmp/wp-images.txt

echo ""
echo "=== DONE ==="
