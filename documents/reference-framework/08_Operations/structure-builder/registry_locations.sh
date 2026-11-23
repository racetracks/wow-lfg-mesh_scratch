#!/bin/sh
# Prints the rows of 16_Registries/16_02_Registry_Locations.md: every live line in scratch and the
# addon CLAUDE.md that names the registry's location (DEC-00019).
# usage: sh registry_locations.sh <scratch checkout> <addon checkout>
set -e
S=${1:?scratch}; A=${2:?addon}
cd "$S"
grep -rnE "REGISTRY\.md|docs/reference-framework" --include=*.md --include=*.py . | grep -v "^./drafts/\|^./temp/\|/reference/" | while IFS=: read -r f l rest; do
	f=${f#./}
	case $f in
	docs/reference-framework/REGISTRY.md) continue;;
	docs/reference-framework/refkey.py) a="moved to 08_Operations/registry-tool/; old path becomes a wrapper";;
	docs/reference-framework/*) a="history: unchanged; README.md gains a pointer";;
	*) a="repoint to the new path";;
	esac
	n=$(echo "$rest" | grep -oE "REGISTRY\.md|docs/reference-framework/refkey\.py|docs/reference-framework/?" | sort -u | tr '\n' ' ')
	echo "| scratch | \`$f:$l\` | \`${n% }\` | $a |"
done
cd "$A"
grep -nE "REGISTRY\.md|docs/reference-framework" CLAUDE.md | while IFS=: read -r l rest; do
	n=$(echo "$rest" | grep -oE "REGISTRY\.md|docs/reference-framework/refkey\.py|docs/reference-framework/?" | sort -u | tr '\n' ' ')
	echo "| addon | \`CLAUDE.md:$l\` | \`${n% }\` | repoint (a docs build) |"
done
