#!/bin/sh
# Write a claude.local.md with the fixed rules (DEC-00016, DEC-00020, DEC-00021; draft rule DEC-00021).
# Usage: sh write_claude_local.sh [--draft] <path/claude.local.md> "<folder label>" ["- excluded file" lines...]
# --draft adds rule 7 and an empty "Promotion watch" table (drafts only). Never overwrites.
DR=""; [ "$1" = "--draft" ] && { DR=1; shift; }
P=$1; L=$2; shift 2
[ -e "$P" ] && exit 0
{
	echo "# claude.local.md: $L"
	echo
	echo "## Rules"
	echo "1. Brief when empty: when updating documentation in this folder, keep a document with no information extremely brief, telling the reader that the appendix, summary and references say where to find what they want."
	echo "2. Do not read: when reading or reviewing documentation, do not open, read, crawl or index any file listed under \"Excluded files\""
	echo "3. Do not update: when updating documentation, do not update any file listed under \"Excluded files\"."
	echo "4. Keep the list current: when updating documentation in this folder, add every document with no relevant content to \"Excluded files\", so it is neither read nor updated going forward. A file leaves the list only when content for it arrives: remove it and fill it in the same commit."
	echo "5. Changelog: when updating documentation in this folder, add a row to this folder's changelog (00_Changelog.md, or NN_00_Changelog.md in a numbered subfolder) for every change: date, document, reference, change (added, changed, retired), reason, context. A retirement row names the document, the retired reference, its replacement and the reason."
	echo "6. Cite context: when drafting or changing a reference, cite the temp workspace memory it came from (a temp/<YYYY>/<MM>/<DD>/<hh-mm-ss>-<Ddd>-<workspace>/prompts/ entry or output README.md) or its stakeholder input (STK) key, so the reason can be read later."
	[ -n "$DR" ] && echo "7. Promotion watch (drafts only): every change in this draft that must carry over to live (a key to move or retire, a path to repoint, a live document to change) gets a row under \"Promotion watch\"; promotion works through every row and the list is empty when the draft goes live."
	echo
	echo "## Excluded files"
	if [ $# -eq 0 ]; then echo "- (none)"; else for x in "$@"; do echo "$x"; done; fi
	echo
	echo "## Never excluded"
	echo "Readme.md, claude.local.md, every changelog, the root 00_Appendix.md, 00_References.md, 00_Decisions.md and 01_Summary.md, and everything in 13_Release_Notes and 14_Code_Reference."
	if [ -n "$DR" ]; then
		echo
		echo "## Promotion watch"
		echo "| Change | Live target | Done at promotion |"
		echo "| --- | --- | --- |"
	fi
} > "$P"
