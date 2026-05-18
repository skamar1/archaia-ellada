#!/bin/bash
set -e
cd "$(dirname "$0")"

while IFS= read -r url; do
  path="${url#https://archaia-ellada.gr}"
  dir="static$(dirname "$path")"
  mkdir -p "$dir"
  if [ ! -f "static$path" ]; then
    curl -sL --max-time 15 "$url" -o "static$path" && echo "OK: $path" || echo "FAIL: $url"
  else
    echo "SKIP: $path"
  fi
done < /tmp/wp-images.txt

echo ""
echo "=== DONE ==="
