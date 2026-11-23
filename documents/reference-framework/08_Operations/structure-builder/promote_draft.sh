#!/bin/sh
# Promote a draft to its documents/ folder (DEC-00030): copy the draft over the placeholder
# (its changelog rows kept), drop every Promotion watch and rule 7 (drafts only), move the old live folder (if any) and the
# draft to history/ with pointer stubs (leave_pointers.sh), and repoint every live link and the
# registry's file column. history/, temp/ (each session updates its own), changelogs and commit-pinned links are never rewritten.
# Run from the scratch root; test on a full copy first (cp -a, pwd checked; DEC-00032 step 4).
# usage: sh promote_draft.sh <draft> <live> <history for the draft> "<context>" [<old live> <history for it>]
set -e
DR=${1%/}; LV=${2%/}; HD=${3%/}; C=$4; OL=${5%/}; HO=${6%/}
H=$(cd "$(dirname "$0")" && pwd)
[ -d "$DR" ] && [ -e .git ] || { echo "run from the scratch root with an existing draft"; exit 1; }
keep=""
[ -f "$LV/00_Changelog.md" ] && keep=$(sed -n '/^| --- |/,$p' "$LV/00_Changelog.md" | tail -n +2)
mkdir -p "$LV"
cp -a "$DR"/. "$LV"/
[ -n "$keep" ] && printf '%s\n' "$keep" >> "$LV/00_Changelog.md"
find "$LV" -name claude.local.md | while read -r f; do
	awk '/^## Promotion watch/{skip=1} /^7\. Promotion watch/{next} !skip' "$f" > "$f.t" && mv "$f.t" "$f"
done
if [ -n "$OL" ]; then
	mkdir -p "$(dirname "$HO")"; git mv "$OL" "$HO"; sh "$H/leave_pointers.sh" "$OL" "$HO" "$C"
fi
mkdir -p "$(dirname "$HD")"; git mv "$DR" "$HD"; sh "$H/leave_pointers.sh" "$DR" "$HD" "$C"
git add -A
# repoint live links; never history/, temp/, changelogs (history text) or a commit-pinned
# link (/blob/<sha>/..., DEC-00026)
git ls-files '*.md' | grep -v '^history/' | grep -v '^temp/' | grep -v 'Changelog\.md$' | python3 -c '
import re, sys
pairs = [p.split("=", 1) for p in sys.argv[1:] if p.split("=", 1)[0]]
for f in sys.stdin.read().split("\n"):
	if not f:
		continue
	if any(f.startswith(o + "/") for o, _ in pairs):
		continue
	s = open(f, encoding="utf-8").read(); t = s
	for o, n in pairs:
		t = re.sub(r"(?<![0-9a-f]{40}/)" + re.escape(o), n, t)
	if t != s:
		open(f, "w", encoding="utf-8").write(t)
' "$DR=$LV" "${OL:-}=${HO:-}"
echo "promoted $DR -> $LV"
