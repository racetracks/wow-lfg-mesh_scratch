#!/bin/sh
# Allocate several reference keys in one go (DEC-00037), then push the registry.
# Usage (from the scratch root, on a freshly pulled main):
#   sh alloc_keys.sh <CMP-key> <folder> < list
# where each line of list is: TYPE|file-in-folder|title
CMP=$1; DIR=$2
RK=documents/reference-framework/08_Operations/registry-tool/refkey.py
[ -f "$RK" ] || RK=docs/reference-framework/refkey.py
while IFS='|' read -r t f title; do
	[ -n "$t" ] || continue
	python3 "$RK" alloc "$t" "$CMP" "$DIR/$f" "$title" || exit 1
done
python3 "$RK" check
