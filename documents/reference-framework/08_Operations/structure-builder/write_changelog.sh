#!/bin/sh
# Write a folder's changelog with its first row (DEC-00020). Never overwrites.
# Usage: sh write_changelog.sh <path/00_Changelog.md> "<folder label>" "<context>"
P=$1; L=$2; C=$3
[ -e "$P" ] && exit 0
N=$(basename "$P" .md)
{
	echo "# $N: $L"
	echo
	echo "Every change to this folder's documents, newest first (claude.local.md rule 5). A retirement names the document, the retired reference, its replacement and the reason. Every row's Context ends with the before link of each changed document (DEC-00026, before_link.sh)."
	echo
	echo "| Date | Document | Reference | Change | Reason | Context |"
	echo "| --- | --- | --- | --- | --- | --- |"
	echo "| $(date +%Y-%m-%d) | (this folder) | - | created | folder created by structure-builder | $C; before: new |"
} > "$P"
