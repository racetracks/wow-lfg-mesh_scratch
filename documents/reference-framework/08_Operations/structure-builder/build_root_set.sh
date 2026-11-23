#!/bin/sh
# Writes the root set (05_Detailed_Design.md:1) into FOLDER with brief placeholder text and a
# claude.local.md in every folder that excludes the placeholders (05_Detailed_Design.md:3).
# Never overwrites an existing file. Allocates no keys: keys come with the first real content.
# Headings are one line, keys on the right (DEC-00028). Every folder gets a changelog (DEC-00020).
# TEMP_WS=temp/<YYYY>/<MM>/<DD>/<hh-mm-ss>-<Ddd>-<workspace> adds the Session context link to every references file (DEC-00027).
# usage: [TEMP_WS=...] sh build_root_set.sh [--draft] <folder> "<capability label>" ["<keys line>"] ["<context>"]
set -e
DR=""; [ "$1" = "--draft" ] && { DR=--draft; shift; }
F=$1; L=$2; K=${3:-"(keys allocated with the first content)"}; C=${4:-structure-builder}
[ -n "$F" ] && [ -n "$L" ] || { echo "usage: build_root_set.sh <folder> <label>"; exit 1; }
BRIEF="Not documented yet. See 00_Appendix.md for every key, 01_Summary.md for the state and 00_References.md for where things moved."
put() { [ -e "$1" ] || printf '%s\n' "$2" > "$1"; }
SC=""; [ -n "$TEMP_WS" ] && SC="

Session context (\`DEC-00027\`): [$TEMP_WS/](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/$TEMP_WS)."
ref() { case $1 in *00_References) printf '%s' "$SC";; esac; }
H=$(cd "$(dirname "$0")" && pwd)
local_md() { # $1 dir, $2 label, $3 excluded lines (one string)
	OLDIFS=$IFS; IFS='
'
	set -- "$1" "$2" $3
	IFS=$OLDIFS
	d=$1; l=$2; shift 2
	sh "$H/write_claude_local.sh" $DR "$d/claude.local.md" "$l" "$@"
}
mkdir -p "$F"
EX=""
for n in 00_Appendix 00_References 00_Decisions 01_Summary 02_Requirements 03_Scope 04_High_Level_Design 05_Detailed_Design 06_Architecture 07_Roadmap 08_Operations 09_Current_Features 10_Planned_Features 11_Known_Issues 12_User_Guides 13_Release_Notes 14_Code_Reference 15_Tests 16_Registries; do
	put "$F/$n.md" "# $n: $L $K

$BRIEF$(ref $n)"
	case $n in 00_Appendix|00_References|00_Decisions|01_Summary|13_Release_Notes|14_Code_Reference) ;; *) EX="$EX
- \`$n.md\` (placeholder)";; esac
done
put "$F/Readme.md" "# Readme: $L $K

Documentation folder (Mandatory Documentation Requirements). $BRIEF"
local_md "$F" "$L" "${EX#?}"
sh "$H/write_changelog.sh" "$F/00_Changelog.md" "$L" "$C"
for s in 08_Operations 09_Current_Features 10_Planned_Features 11_Known_Issues 12_User_Guides 13_Release_Notes 14_Code_Reference 15_Tests 16_Registries; do
	n=${s%%_*}; d="$F/$s"; mkdir -p "$d"
	put "$d/Readme.md" "# Readme: $s of $L $K

$BRIEF"
	for x in 00_Appendix 00_References 01_Summary; do put "$d/${n}_$x.md" "# ${n}_$x: $s of $L $K

$BRIEF$(ref $x)"; done
	sh "$H/write_changelog.sh" "$d/${n}_00_Changelog.md" "$s of $L" "$C"
	case $s in 13_*|14_*) E="- (none: release notes and the code reference are never excluded)";;
	*) E="- \`${n}_00_Appendix.md\` (placeholder)
- \`${n}_00_References.md\` (placeholder)
- \`${n}_01_Summary.md\` (placeholder)";; esac
	local_md "$d" "$s of $L" "$E"
done
