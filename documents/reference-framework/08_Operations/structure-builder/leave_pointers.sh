#!/bin/sh
# Leave pointers at a moved folder's old path (DEC-00030): a one-line stub for every markdown file now
# under NEW, a Readme.md when the folder had no README.md, and in every old folder a claude.local.md
# excluding the stubs and a 00_Changelog.md with the move row. Non-markdown files get no stub.
# Usage: sh leave_pointers.sh <old dir> <new dir> "<context>"
O=${1%/}; NW=${2%/}; C=$3
H=$(cd "$(dirname "$0")" && pwd)
U=https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main
D=$(date +%Y-%m-%d)
( cd "$NW" && find . -type f -name '*.md' ) | while read -r f; do
	f=${f#./}; mkdir -p "$O/$(dirname "$f")"
	enc=$(printf '%s' "$NW/$f" | sed 's/ /%20/g')
	printf '# Moved\n\nMoved on %s to [%s/%s](%s/%s) (document migration, DEC-00030).\n' "$D" "$NW" "$f" "$U" "$enc" > "$O/$f"
done
( cd "$NW" && find . -type d ) | while read -r d; do
	d=${d#./}; od="$O/$d"; [ "$d" = "." ] && od="$O"; mkdir -p "$od"
	[ -e "$od/README.md" ] || [ -e "$od/Readme.md" ] || printf '# Moved\n\nThis folder moved on %s to %s (document migration, DEC-00030).\n' "$D" "$NW/${d#.}" > "$od/Readme.md"
	ex=$(cd "$od" && ls *.md 2>/dev/null | grep -v '^Readme.md$\|^README.md$\|^00_Changelog.md$\|^claude.local.md$' | sed 's/^/- `/;s/$/` (pointer stub)/')
	rm -f "$od/claude.local.md"
	if [ -n "$ex" ]; then OLDIFS=$IFS; IFS='
'; sh "$H/write_claude_local.sh" "$od/claude.local.md" "$od (moved)" $ex; IFS=$OLDIFS
	else sh "$H/write_claude_local.sh" "$od/claude.local.md" "$od (moved)"; fi
	[ -e "$od/00_Changelog.md" ] || sh "$H/write_changelog.sh" "$od/00_Changelog.md" "$od (moved)" "$C"
	printf '| %s | (this folder) | - | moved | moved to %s; pointers left | %s |\n' "$D" "$NW" "$C" >> "$od/00_Changelog.md"
done
