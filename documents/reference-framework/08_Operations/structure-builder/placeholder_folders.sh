#!/bin/sh
# Create placeholder capability folders (DEC-00017, DEC-00017): Readme.md (light details),
# claude.local.md (the fixed rules) and 00_Changelog.md; no documents. Never overwrites.
# Usage: sh placeholder_folders.sh <parent folder> "<what the folders are>" "<context>" name...
P=$1; W=$2; C=$3; shift 3
H=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$P"
for n in "$@"; do
	mkdir -p "$P/$n"
	[ -e "$P/$n/Readme.md" ] || printf '# %s\n\n%s: `%s`. Placeholder: not documented yet. When it is, the full root set is created here (00_Appendix.md to 16_Registries.md, subfolders 08 to 16).\n' "$n" "$W" "$n" > "$P/$n/Readme.md"
	sh "$H/write_claude_local.sh" "$P/$n/claude.local.md" "$n"
	sh "$H/write_changelog.sh" "$P/$n/00_Changelog.md" "$n" "$C"
done
