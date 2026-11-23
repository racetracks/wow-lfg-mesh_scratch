#!/bin/sh
# Start a revision draft of a live documentation folder: copy the live folder into
# drafts/, leave the registry out (it stays live only, the one source of keys), empty every
# changelog to its header (promote_draft.sh appends the live rows back), add rule 7 and an empty
# Promotion watch to every claude.local.md (DEC-00021), then run build_root_set.sh --draft so any
# missing root-set file is written (it never overwrites). Run from the scratch root.
# usage: [TEMP_WS=temp/...] sh start_revision_draft.sh <live folder> <draft folder> "<label>"
set -e
LV=${1%/}; DR=${2%/}; L=$3
[ -d "$LV" ] && [ -e .git ] && [ ! -e "$DR" ] || { echo "run from the scratch root; live must exist, draft must not"; exit 1; }
H=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$DR"; cp -a "$LV"/. "$DR"/
rm -f "$DR/16_Registries/REGISTRY.md"
find "$DR" -name '*Changelog.md' | while read -r f; do
	awk '{print} /^\| --- \|/{exit}' "$f" > "$f.t" && mv "$f.t" "$f"
done
R7='7. Promotion watch (drafts only): every change in this draft that must carry over to live (a key to move or retire, a path to repoint, a live document to change) gets a row under "Promotion watch"; promotion works through every row, then empties the table.'
find "$DR" -name claude.local.md | while read -r f; do
	grep -q '^## Promotion watch' "$f" && continue
	awk -v r7="$R7" '{print} /^6\. Cite context/{print r7}' "$f" > "$f.t" && mv "$f.t" "$f"
	printf '\n## Promotion watch\n| Change | Live target | Done at promotion |\n| --- | --- | --- |\n' >> "$f"
done
sh "$H/build_root_set.sh" --draft "$DR" "$L"
echo "draft $DR from $LV"
